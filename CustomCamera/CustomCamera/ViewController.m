//
//  ViewController.m
//  CustomCamera
//
//  Created by Artur on 09/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

#pragma mark - Category

@interface UIView (Rounded)

//view must be square
+ (instancetype)roundedWithBlackBorderAndShadow:(UIView *)view;

@end

@implementation UIView (Rounded)

+ (instancetype)roundedWithBlackBorderAndShadow:(UIView *)view
{
    CGFloat height = view.frame.size.height;
    
    // border radius
    [view.layer setCornerRadius:height/2];
    
    // border
    [view.layer setBorderColor:[UIColor blackColor].CGColor];
    [view.layer setBorderWidth:1.5f];
    
//    // drop shadow
//    [view.layer setShadowColor:[UIColor blackColor].CGColor];
//    [view.layer setShadowOpacity:0.8];
//    [view.layer setShadowRadius:3.0];
//    [view.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    return view;
}

@end

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *frameForCapture;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;

@property (strong, nonatomic) NSString *restorationID;

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;

@end

@implementation ViewController



#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if([self isViewLoaded] && ![[self view] window]) {
        [self setView:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.restorationID = self.restorationIdentifier;
    
    if ([_restorationID isEqualToString:@"ViewController"])
    {
        self.takePhotoButton = (UIButton *)[UIView roundedWithBlackBorderAndShadow:_takePhotoButton];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if ([_restorationID isEqualToString:@"ViewController"])
    {
        if (self.session == nil)
        {
            self.session = [[AVCaptureSession alloc] init];
            [self.session setSessionPreset:AVCaptureSessionPresetPhoto];
            
            AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
            
            NSError *error;
            AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
            
            if ([_session canAddInput:deviceInput]) {
                [_session addInput:deviceInput];
            }
            
            AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
            [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
            
            CALayer *rootLayer = [[self view] layer];
            [rootLayer setMasksToBounds:YES];
            CGRect frame = self.frameForCapture.frame;
            [previewLayer setFrame:frame];
            [rootLayer insertSublayer:previewLayer atIndex:0];
            
            //output
            self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
            NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey   , nil];
            [self.stillImageOutput setOutputSettings:outputSettings];
            
            [self.session addOutput:_stillImageOutput];
            [self.session startRunning];
        }
    }
}

#pragma mark - Events

- (IBAction)takePhotoButtonWasPressed:(id)sender {
    
    [self takePhoto];
}

#pragma mark - Actions

- (void)takePhoto
{
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in _stillImageOutput.connections)
    {
        
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
        
        if (videoConnection) {
            break;
        }
    }
    
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        if (imageDataSampleBuffer != NULL) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            UIImage *image = [UIImage imageWithData:imageData];
            //self.imageView.image = image;
            
            ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController-1"];
            [self presentViewController:vc animated:NO completion:nil];
            vc.imageView.image= image;
            vc.label.text = @"display image";
        }
    }];
}
- (IBAction)backButtonWasPressed:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)dealloc
{
    //[super dealloc];
    
    self.session = nil;
    self.stillImageOutput = nil;
    
    self.imageView = nil;
}

@end

//
//  ViewController.m
//  YoutubeAPITest
//
//  Created by Artur on 27/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"
#import "VideoCell.h"
#import "BTVideo.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSMutableData *responseData;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *videoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoArray = [@[] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)searchButtonWasPressed:(id)sender
{
    //NSString *urlString = @"https://api.vk.com/method/friends.get?count=20&fields=photo_50&name_case=nom&offset=0&order=name&user_id=26955116";
    
    //NSString *urlString = @"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=lada+x-ray&key=AIzaSyBy2Gwff3TRQHvtgRS4LX1l6ovfDvO8ZS4";
    
    NSString *urlString = @"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&q=lada+x-ray&safeSearch=strict&key=AIzaSyBy2Gwff3TRQHvtgRS4LX1l6ovfDvO8ZS4";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];

    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        //Cоединение началось.
    }
    
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//                               
//                               NSLog(@"/n/n response = %@", response);
//                           }];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.responseData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"response data - %@", [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding]);
    
    [self parseData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_videoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kVideoCell" forIndexPath:indexPath];
    
    BTVideo *video = [_videoArray objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = video.videoTitle;
    cell.descriptionLabel.text = video.videoDescription;
    
    //dispatch_queue_t kBgQueue;
    dispatch_async(kBgQueue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:video.imageUrl]];
        
        /*
        //Alternative variant
        UIImage *image = [UIImage imageWithContentsOfFile:video.imageUrl];
        */
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.iconImageView.image = [UIImage imageWithData:imageData];
            
            cell.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        });
    });
    
    cell.iconImageButton.tag = indexPath.row;
    
    [cell.iconImageButton addTarget:self action:@selector(iconImageButtonWasPressed:) forControlEvents:UIControlEventTouchDown];

    return cell;
}

- (void)iconImageButtonWasPressed:(UIButton *)sender
{
    BTVideo *video = [_videoArray objectAtIndex:sender.tag];
    
    NSLog(@"\n\n video = %@", video.videoTitle);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self searchVideos];
    
    return YES;
}

- (void)searchVideos
{
    //NSString *urlString = @"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=5&q=lada+x-ray&safeSearch=strict&key=AIzaSyBy2Gwff3TRQHvtgRS4LX1l6ovfDvO8ZS4";
    
    NSString *urlString = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=5&q=%@&safeSearch=strict&key=AIzaSyBy2Gwff3TRQHvtgRS4LX1l6ovfDvO8ZS4", self.textField.text];
    
    NSString *encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:encodedString]];
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection) {
        //Cоединение началось.
    }
}

- (void)parseData
{
    /*
    //SBJSON
    NSString *jsonString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSDictionary *jsonDict = [jsonString JSONValue];
     */

    //NSJSONSerialization
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:nil];
    
    
    
    NSArray *items = [dict objectForKey:@"items"];
    
    for (NSDictionary *item in items) {
        BTVideo *video = [[BTVideo alloc] init];
    
        NSDictionary *itemId = [item objectForKey:@"id"];
        video.videoId = [itemId objectForKey:@"videoId"];
        
        NSDictionary *itemSnippet = [item objectForKey:@"snippet"];
        
        video.videoTitle = [itemSnippet objectForKey:@"title"];
        video.videoDescription = [itemSnippet objectForKey:@"description"];
        
        video.imageUrl = [[[itemSnippet objectForKey:@"thumbnails"] objectForKey:@"default"] objectForKey:@"url"];
     
        [self.videoArray addObject:video];
    }
    
    
    
    [self.tableView reloadData];
}

@end

Audio-AVFoundation
==

##Setup process

Link frameworks and libraries:

`
AVFoundation.framework
`

Libraries for playing audio files:

* MediaPlayer.framework
* AudioToolbox.framework
* OpenAL.framework


Simple app with states: Play, Stop.

Delegate
`
<AVAudioPlayerDelegate>
`

##Example of use

```objc
//Add protocol
@interface AudioPlayerController ()<AVAudioPlayerDelegate>

//Add property
@property (nonatomic, retain) AVAudioPlayer *player;


//Setup Audio method
- (void)setupAudio
{
    NSString *audioUrlPath = [[NSBundle mainBundle] pathForResource:@"warning" ofType:@"caf"];
    NSURL *pathUrl = [[NSURL alloc] initFileURLWithPath:audioUrlPath];

    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathUrl error:&error];
    //self.player.numberOfLoops = 3;
    self.player.delegate = self;
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        [self.player prepareToPlay];
    }   
}

//Play method
- (void)playAudio
{
    [self.player play];
}

//Stop method
- (void)stopAudio
{
    [self.player stop];
}

```

##Example of AudioManager

```objc
@import Foundation;

@interface AudioManager : NSObject

+ (instancetype)sharedManager;

//Setup audio from bundle
- (void)setupAudio:(NSString *)audio;

- (void)playAudio;
- (void)stopAudio;

@end
```

```objc
@import AVFoundation;
#import "AudioManager.h"

@interface AudioManager()<AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *player;

@end

@implementation AudioManager

#pragma mark - Shared Singleton

+ (instancetype)sharedManager
{
    static AudioManager *manager = nil;

    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[self alloc] init];
    });
return manager;
}

#pragma mark - Methods

-(void)setupAudio:(NSString *)audio
{
    NSString *audioUrlPath = [[NSBundle mainBundle] pathForResource:audio ofType:nil];
    NSURL *pathUrl = [[NSURL alloc] initFileURLWithPath:audioUrlPath];

    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathUrl error:&error];
    self.player.numberOfLoops = 3;
    self.player.delegate = self;

    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        [self.player prepareToPlay];
    }
}

- (void)playAudio {
    [self.player play];
}

- (void)stopAudio {
    [self.player stop];
}

@end

```

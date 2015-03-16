Audio-AVFoundation
==

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

Example of use

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



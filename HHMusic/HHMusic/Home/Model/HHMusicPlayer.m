//
//  HHMusicPlayer.m
//  HHMusic
//
//  Created by LXH on 2017/2/16.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHMusicPlayer.h"

@interface HHMusicPlayer ()<AVAudioPlayerDelegate>
@property (nonatomic, copy) NSString *musicURL;
@property (nonatomic, strong) MPMoviePlayerController *musicPlayer;
@property (nonatomic,copy) void(^didFinish)();
@end

@implementation HHMusicPlayer

/** 单例分享 */
+ (instancetype)playManager;
{
    static HHMusicPlayer *playManger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playManger = [[self alloc] init];
    });
    return playManger;
}

-(void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startPlay)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(flashSongInfo:)
                                                 name:MPMoviePlayerLoadStateDidChangeNotification
                                               object:nil];
}
- (void)startPlay
{
    NSLog(@"播放下一首");
    _didFinish();
}

- (void)flashSongInfo:(id)info
{
    switch (self.musicPlayer.loadState) {
        case MPMovieLoadStatePlayable:
            NSLog(@"播放状态:----可播放");
            break;
        case MPMovieLoadStatePlaythroughOK:
             NSLog(@"播放状态:----状态为缓冲几乎完成，可以连续播放");
            break;
        case MPMovieLoadStateStalled:
             NSLog(@"播放状态:----缓冲中");
            break;
        case MPMovieLoadStateUnknown:
             NSLog(@"播放状态:----未知状态");
            break;
        default:
            break;
    }

}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addNotification];
    }
    return self;
}
- (void)playMusicWithURL:(NSString *)musicURL didFinish:(void(^)())didFinish {
    if (_musicURL != musicURL) {
        // 播放音乐
        NSURL *url = [NSURL URLWithString:musicURL];
        [self.musicPlayer setContentURL:url];
        [self.musicPlayer play];
        [self setCurrentTime:0];
        
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
        self.player = player;
        [player prepareToPlay];
        _didFinish = didFinish;
        
    }
   
}
//暂停
- (void)pause
{
    [self.musicPlayer pause];
}

- (void)play
{
    [self.musicPlayer play];
}
- (MPMoviePlayerController *)musicPlayer{
    if (!_musicPlayer) {
        _musicPlayer = [[MPMoviePlayerController alloc] init];
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        [session setActive:YES error:nil];
    }
    return _musicPlayer;
}

#pragma mark setters 和getters方法
- (NSTimeInterval)currentTime {
    return self.musicPlayer.currentPlaybackTime;
}

- (NSTimeInterval)duration {
    return self.musicPlayer.duration;
}

- (void)setCurrentTime:(NSTimeInterval)currentTime {
    self.musicPlayer.currentPlaybackTime = currentTime;
}
@end

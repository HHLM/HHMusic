//
//  HHMusicPlayer.h
//  HHMusic
//
//  Created by LXH on 2017/2/16.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface HHMusicPlayer : NSObject

@property (nonatomic,assign) NSTimeInterval currentTime;
@property (nonatomic,assign) NSTimeInterval duration;

@property (nonatomic, strong) AVAudioPlayer *player;
/** 单例分享 */
+ (instancetype)playManager;

- (void)playMusicWithURL:(NSString *)musicURL didFinish:(void(^)())didFinish;
;

//暂停
- (void)pause;
//播放
- (void)play;
@end

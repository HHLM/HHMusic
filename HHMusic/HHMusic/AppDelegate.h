//
//  AppDelegate.h
//  HHMusic
//
//  Created by LXH on 2017/1/11.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "HHAppdelegate.h"
@interface AppDelegate : HHAppdelegate <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AVPlayerViewController *player;

- (MPMoviePlayerController *)mediaPalyer;
- (AVPlayerViewController *)player;

@end


//
//  HHHomeVC.h
//  HHMusic
//
//  Created by LXH on 2017/1/11.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHHomeVC : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *liveTime;

@property (weak, nonatomic) IBOutlet UILabel *musicTime;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *musicName;
@property (weak, nonatomic) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

//定时器
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger currentMusicIndex;
@end

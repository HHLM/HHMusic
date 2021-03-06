//
//  HHHomeVC.m
//  HHMusic
//
//  Created by LXH on 2017/1/11.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHHomeVC.h"
#import "HHMusicModel.h"
#import "HHMusicPlayer.h"
#import "BindingAlertView.h"
#import <UIImageView+WebCache.h>

@class AppDelegate;

@interface HHHomeVC ()
{
    HHMusicModel *music;
    AppDelegate *app;
}
@end



@implementation HHHomeVC


- (void)hh_creatUI
{
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:self.view.bounds];
    toolbar.barStyle = UIBarStyleBlack;
    [self.bgView addSubview:toolbar];
    self.iconView.layer.cornerRadius = self.iconView.frame.size.width/2;
    self.iconView.clipsToBounds = YES;
    //滑块拖动时的事件
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self hh_creatUI];
    music = [[HHMusicModel alloc] init];
    music.type = @"n";
    music.sid = @"000";
    [self hh_musicInfoWithModel:music];
<<<<<<< HEAD
//    [self group];
=======
    [self group];
>>>>>>> e720904b37e9d5cf033d59d533ce2e4c21e96fd7
}

- (void)group {
    dispatch_group_t group =  dispatch_group_create();
    
    for (int i = 0; i < 10; i ++)
    {
        dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
            [self requestfilterData];
            //1
        });
    }
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        //汇总结果
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //UI操作
            
        });
    });
    
}


-(void)requestfilterData
{
     NSString *kBaseURL = @"http://douban.fm/j/mine/playlist?type=n&sid=0&pt=0&channel=1&from=mainsite";
    NSURL *url = [NSURL URLWithString:kBaseURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    [request setHTTPMethod:@"POST"];
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data =[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error) {
        NSLog(@" good commet list recv data error");
    }else
    {
        NSLog(@"----%@",data);
        
        NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil]);
    }
}


#pragma mark -- 调整音乐
- (void)sliderValueChanged:(UISlider *)slider
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HHMusicPlayer playManager].currentTime = slider.value  *  [music.length integerValue];
    });
   
}

- (void)starUpdateProgress
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updataProgress) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    [[HHMusicPlayer playManager] play];
    //开启定时器
    [self.timer setFireDate:[NSDate date]];
}
- (void)stopUpdateProgress
{
    [self.timer invalidate];
    self.timer = nil;
}
//暂停
- (void)puseUpdateProgress
{
    [[HHMusicPlayer playManager] pause];
    [self.timer invalidate];
    self.timer = nil;
    //关闭定时器
    [self.timer setFireDate:[NSDate distantFuture]];
}
- (void)updataProgress
{
    self.iconView.transform = CGAffineTransformRotate(self.iconView.transform, M_PI_2 * 0.01);
    self.slider.value = [HHMusicPlayer playManager].currentTime/[music.length integerValue];
    self.liveTime.text = [self timeString:(unsigned)[HHMusicPlayer playManager].currentTime];
}

- (IBAction)lastMusic:(id)sender
{
    [self stopUpdateProgress];
    music.type = @"s";
    [self hh_musicInfoWithModel:music];
}

- (IBAction)playMusic:(UIButton *)sender
{
    if (sender.selected) {
        sender.selected = NO;
        [self starUpdateProgress];
    }else{
        sender.selected = YES;
        [self puseUpdateProgress];
    }
}
- (IBAction)nextMusic:(id)sender
{
    [self stopUpdateProgress];
    music.type = @"r";
    [self hh_musicInfoWithModel:music];
}
- (void)hh_musicInfoWithModel:(HHMusicModel *)model
{
    [HHMusicModel getMusicInfoWithSid:model.sid type:model.type pt:@"" blcok:^(id data, NSError *eror) {
<<<<<<< HEAD
        music = data;
        NSLog(@"音乐信息：%@---%@",music.sid,music.url);
//        [self playMusicInfo];
=======
        if (!eror) {
            music = data;
            NSLog(@"音乐信息：%@---%@",music.sid,music.url);
            [self playMusicInfo];
        }else {
            
        }
       
>>>>>>> e720904b37e9d5cf033d59d533ce2e4c21e96fd7
    }];
}
- (void)next
{
    [self stopUpdateProgress];
    music.type = @"p";
    [self hh_musicInfoWithModel:music];
}
- (void)playMusicInfo
{
    //http://mr3.doubanio.com/13cf655ccd62929da443427da3829152/0/fm/song/p2741515_128k.mp4
    //播放音乐
    [[HHMusicPlayer playManager] playMusicWithURL:music.url didFinish:^{
        [self next];
    }];
    [self.playBtn setSelected:NO];
    [self starUpdateProgress];

    
    self.musicTime.text = [self timeString:[music.length integerValue]];
    self.musicName.text = music.title;
    NSArray *info = music.singers;
    NSDictionary *dic = [info firstObject];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:dic[@"avatar"]]
                     placeholderImage:[UIImage imageNamed:@"plaer.jpg"]];
    
    [self.bgView sd_setImageWithURL:[NSURL URLWithString:dic[@"avatar"]]
                   placeholderImage:[UIImage imageNamed:@"plaer.jpg"]];
    self.playerName.text = dic[@"name"];
    
}

- (NSString *)timeString:(NSInteger)timeLenght
{
    NSInteger min = timeLenght / 60;
    NSInteger second = timeLenght % 60;
    NSString *time = [NSMutableString stringWithFormat:@"%ld:%ld",min,second];
    if (second < 10) {
        time = [NSMutableString stringWithFormat:@"%ld:0%ld",min,second];
    }
    return time;

}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [BindingAlertView showAlertViewWithTitle:@"HHH" message:@"你知道你在做啥子么" cancelButtonTitle:@"不知道" otherButtonTitle:@"知道么" block:^(NSInteger index) {
//        NSLog(@"ddddd");
//    }];
//}
@end

//
//  HHPlayerVC.m
//  HHMusic
//
//  Created by LXH on 2017/2/13.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHPlayerVC.h"
#import "HHSlider.h"
@interface HHPlayerVC ()

@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *playerLab;
@property (nonatomic, strong) UILabel *musicLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) HHSlider *slider;


@end

@implementation HHPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#pragma mark -- CreeatUI

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    }
    return _scrollView;
}
- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithFrame:CGRectMake(kSWidth/2 - 100, 40,200, 200)];
        _bgView.backgroundColor =[UIColor greenColor];
        _bgView.layer.cornerRadius = 100;
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}


-(UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10,180, 180)];
        _iconView.backgroundColor =[UIColor redColor];
        _iconView.layer.cornerRadius = 90;
        _iconView.clipsToBounds = YES;
    }
    return _iconView;
}

- (HHSlider *)slider
{
    if (!_slider) {
        _slider = [[HHSlider alloc] initWithFrame:CGRectMake(50, 0,100, 5)];
    }
    return _slider;
}
@end

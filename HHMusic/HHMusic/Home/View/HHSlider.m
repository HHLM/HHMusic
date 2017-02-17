//
//  HHSlider.m
//  HHMusic
//
//  Created by LXH on 2017/2/13.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHSlider.h"

@implementation HHSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

//!< 重写 此方法 是为了 避免因添加图片  滑块在左边或者右边 时候漏出一点控件  滑块儿不靠边
- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
    rect.origin.x = rect.origin.x - 5 ;
    rect.size.width = rect.size.width +10;
    return CGRectInset ([super thumbRectForBounds:bounds trackRect:rect value:value], 5 , 5);
}
//!< 可以改变高度
-(CGRect)trackRectForBounds:(CGRect)bounds
{
    //    bounds.origin.x=10;
    //    bounds.origin.y=bounds.size.height/3;
    
    bounds.size.height=5;
    self.layer.cornerRadius = 2.5;
    self.clipsToBounds = YES;
//    bounds.size.width=bounds.size.width-20;
    return bounds;
}
//- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds{
//    bounds.size.height=5;
//    self.layer.cornerRadius = 2.5;
//    //    self.clipsToBounds = YES;
//    //    bounds.size.width=bounds.size.width-20;
//    return bounds;
//}
//- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds
//{
//    bounds.size.height=2;
//    self.layer.cornerRadius = 2.5;
//    //    self.clipsToBounds = YES;
//    //    bounds.size.width=bounds.size.width-20;
//    return bounds;
//}

@end

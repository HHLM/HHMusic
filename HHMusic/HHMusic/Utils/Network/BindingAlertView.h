//
//  BindingAlertView.h
//  Haoshiqi
//
//  Created by haoshiqi on 2017/2/14.
//  Copyright © 2017年 haoshiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BindingBlock)(NSInteger index);

typedef NS_ENUM(NSInteger, BindingAlertViewStyle)
{
    BindingAlertViewStylePhone,
    BindingAlertViewStyleWX
};

@interface BindingAlertView : UIView


+ (BindingAlertView *)showAlertViewWithTitle:(NSString *)title
                                     message:(NSString *)message
                           cancelButtonTitle:(NSString *)cancelButtonTitle
                            otherButtonTitle:(NSString *)otherButtonTitle
                                       block:(BindingBlock)block;

@end

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

//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) BindingAlertViewStyle alertViewStyle;


+ (BindingAlertView *)shareAlertViewBlock:(BindingBlock)block;


+ (BindingAlertView *)showAlertViewWithTitle:(NSString *)title
                                     message:(NSString *)message
                           cancelButtonTitle:(NSString *)cancelButtonTitle
                            otherButtonTitle:(NSString *)otherButtonTitle
                                       block:(BindingBlock)block;

+ (BindingAlertView *)showAlertViewStyle:(BindingAlertViewStyle )alertViewStyle
                                   block:(BindingBlock)block;

@end

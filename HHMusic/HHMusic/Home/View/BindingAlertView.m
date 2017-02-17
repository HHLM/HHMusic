//
//  BindingAlertView.m
//  Haoshiqi
//
//  Created by haoshiqi on 2017/2/14.
//  Copyright © 2017年 haoshiqi. All rights reserved.
//

#import "BindingAlertView.h"

static NSString *bingWXString = @"检测到该微信号已是好食期用户，为了避免多账户给您带来困扰，我们将合并账户信息。主要合并内容如下：\n\n•订单信息\n•优惠券信息\n•地址信息\n•购物车信息\n•收藏信息\n\n合并之后，以上所有信息稍后都可查看，请您不必担心";
static NSString *bingPhoneString = @"检测到该手机号已是好食期用户，为了避免多账户给您带来困扰，我们将合并账户信息。主要合并内容如下：\n\n•订单信息\n•优惠券信息\n•地址信息\n•购物车信息\n•收藏信息\n\n合并之后，以上所有信息稍后都可查看，请您不必担心";

@interface BindingAlertView ()

@property (nonatomic, strong) UIView *viewBackground;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UITextView *textViewMessage;
@property (nonatomic, strong) UIButton *buttonCancel;
@property (nonatomic, strong) UIButton *buttonConfirm;

@property (nonatomic, copy) NSString *cancelTitle;
@property (nonatomic, copy) NSString *otherTitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) BindingBlock blcok;

@end

@implementation BindingAlertView

- (instancetype)initWithFrame:(CGRect)frame  block:(BindingBlock)block;
{
    self = [super initWithFrame:frame];
    if (self) {
        _blcok = block;
        _title = @"HHLM";
        _message = bingWXString;
        _cancelTitle = @"取消";
        _otherTitle = @"确定";
    
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showAlertView];
        });

        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showAlertView];
        });

    }
    return self;
}

+ (BindingAlertView *)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle  block:(BindingBlock)block;
{
    UIView *window = [UIApplication sharedApplication].keyWindow;
    return [[self alloc] initWithFrame:window.bounds showAlertViewWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitle:otherButtonTitle  block:(BindingBlock)block];
}

- (instancetype)initWithFrame:(CGRect)frame showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle block:(BindingBlock)block;
{
    self = [super initWithFrame:frame];
    if (self) {
        _blcok = [block copy];
        _title = title;
        _message = message;
        _cancelTitle = cancelButtonTitle;
        _otherTitle = otherButtonTitle;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showAlertView];
        });
    }
    return self;
}
+ (BindingAlertView *)shareAlertViewBlock:(BindingBlock)block;{
    UIView *window = [UIApplication sharedApplication].keyWindow;
    return [[self alloc] initWithFrame:window.bounds block:(BindingBlock)block];
}

+ (BindingAlertView *)showAlertViewStyle:(BindingAlertViewStyle )alertViewStyle  block:(BindingBlock)block;
{
    UIView *window = [UIApplication sharedApplication].keyWindow;
    return [[self alloc] initWithFrame:window.bounds  AlertViewStyle:alertViewStyle block:(BindingBlock)block];
}

- (instancetype)initWithFrame:(CGRect)frame AlertViewStyle:(BindingAlertViewStyle )alertViewStyle  block:(BindingBlock)block;
{
    self = [super initWithFrame:frame];
    if (self) {
        _blcok = [block copy];
        if (alertViewStyle == BindingAlertViewStylePhone) {
            _title = @"手机合并";
            _message = bingPhoneString;;
        }else{
            _title = @"微信合并";
            _message = bingWXString;
        }
        _cancelTitle = @"完成合并";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showAlertView];
        });

    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    UIView *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    
    if (self.textViewMessage.text) {
       
        CGFloat height1 = self.textViewMessage.contentSize.height;
        CGRect rect = self.textViewMessage.frame;
        rect.size.height = height1;
        self.textViewMessage.frame = rect;
    }
    //判断是不是有俩按钮
    if (_otherTitle.length > 0) {
        CGRect orect = self.buttonConfirm.frame;
        CGRect crect = self.buttonCancel.frame;
        orect.size.width = CGRectGetWidth(self.viewBackground.frame)/2 - 10;
        crect.size.width = CGRectGetWidth(self.viewBackground.frame)/2 - 10;
        crect.origin.x = 10;
        orect.origin.x = CGRectGetWidth(self.viewBackground.frame)/2;
        crect.origin.y = CGRectGetMaxY(self.textViewMessage.frame)+10;
        orect.origin.y = crect.origin.y;
        self.buttonCancel.frame = crect;
        self.buttonConfirm.frame = orect;
    }else
    {
        CGRect rect = self.buttonCancel.frame;
        rect.origin.y = CGRectGetMaxY(self.textViewMessage.frame)+10;
        self.buttonCancel.frame = rect;
    }
    self.viewBackground.frame = CGRectMake(20, 0, kSWidth - 40, CGRectGetMaxY(self.buttonCancel.frame)+10);
    self.viewBackground.center = self.center;
}

- (void)showAlertView
{
   
    UIView *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.75];
    [window addSubview:self];
    [self installView];
    [self showAlertAnimation];
}
- (void)dismissView
{
    [self dismissAlertAnimation];
    [self.viewBackground.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
}
- (void)dismissAlertAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeRemoved;
    animation.duration = .2;
    
    [self.viewBackground.layer addAnimation:animation forKey:@"dismissAlert"];
}
//动画效果
- (void)showAlertAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .3; //时间
    
    [self.viewBackground.layer addAnimation:animation forKey:@"showAlert"];
}


- (void)installView
{
    [self addSubview:self.viewBackground];
    [self.viewBackground addSubview:self.labelTitle];
    [self.viewBackground addSubview:self.textViewMessage];
    [self.viewBackground addSubview:self.buttonCancel];
    self.labelTitle.text = _title;
    self.textViewMessage.text = _message;
    [self.buttonCancel setTitle:_cancelTitle forState:UIControlStateNormal];
    if (_otherTitle.length > 0) {
        [self.buttonConfirm setTitle:_otherTitle forState:UIControlStateNormal];
        [self.viewBackground addSubview:self.buttonConfirm];
    }
    [self layoutSubviews];

    
}


- (UIView *)viewBackground
{
    if (!_viewBackground) {
        _viewBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds) - 40, CGRectGetHeight(self.bounds))];
        _viewBackground.backgroundColor = [UIColor whiteColor];
        _viewBackground.center = self.center;
        
        
        _viewBackground.layer.cornerRadius = 5;
        _viewBackground.clipsToBounds = YES;
    }
    return _viewBackground;
}

- (UILabel *)labelTitle
{
    if (!_labelTitle) {
        _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.viewBackground.frame)-20, 20)];
        _labelTitle.textColor = [UIColor redColor];
        _labelTitle.font = [UIFont systemFontOfSize:18];
//        _labelTitle.text = @"HHLM";
        _labelTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _labelTitle;
}

- (UITextView *)textViewMessage
{
    if (!_textViewMessage) {
        _textViewMessage = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.labelTitle.frame)+10, CGRectGetWidth(self.viewBackground.frame)-20, 50)];
        _textViewMessage.textAlignment = NSTextAlignmentLeft;
        _textViewMessage.textColor = [UIColor greenColor];
        _textViewMessage.font = [UIFont systemFontOfSize:14];;
        _textViewMessage.editable = false;
        _textViewMessage.text = bingPhoneString;
    }
    return _textViewMessage;
}

- (UIButton *)buttonCancel
{
    if (!_buttonCancel) {
        _buttonCancel = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonCancel.frame = CGRectMake(0, CGRectGetMidY(self.textViewMessage.frame), CGRectGetWidth(self.viewBackground.frame), 50);
        _buttonCancel.titleLabel.font = [UIFont systemFontOfSize:16];;
        [_buttonCancel addTarget:self action:@selector(onCancel) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonCancel;
}

- (UIButton *)buttonConfirm
{
    if (!_buttonConfirm) {
        _buttonConfirm = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonConfirm.frame = CGRectMake(0, CGRectGetMidY(self.textViewMessage.frame), CGRectGetWidth(self.viewBackground.frame), 50);
        [_buttonConfirm setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _buttonConfirm.titleLabel.font = [UIFont systemFontOfSize:16];;
        [_buttonConfirm addTarget:self action:@selector(onConfirm) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonConfirm;
}

- (void)setAlertViewStyle:(BindingAlertViewStyle)alertViewStyle
{
    _alertViewStyle = alertViewStyle;
    switch (alertViewStyle) {
        case BindingAlertViewStyleWX:
            self.textViewMessage.text = bingWXString;
            break;
            
        case BindingAlertViewStylePhone:
            self.textViewMessage.text = bingPhoneString;
            break;
            
        default:
            break;
    }
    [self layoutSubviews];
}

#pragma mark - action 

- (void)onConfirm
{
    [self dismissView];
    if (_blcok) {
        _blcok(1);
    }
}
- (void)onCancel
{
    [self dismissView];
    if (_blcok) {
        _blcok(0);
    }
}

@end

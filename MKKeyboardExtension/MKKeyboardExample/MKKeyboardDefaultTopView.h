//
//  MKKeyboardDefaultTopView.h
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKKeyboardShowMarco.h"

@interface MKKeyboardDefaultTopView : UIView

@property (strong, nonatomic) NSString *placeholderString;

@property (strong, nonatomic) NSString *buttonTitle;

@property (assign, nonatomic) CGFloat buttonTitleFont;

@property (strong, nonatomic) UIColor *buttonBackGroundColor;

@property (strong, nonatomic) UIColor *buttonTitleColor;

@property (copy, nonatomic) void (^sureButtonHandle)(NSString *text);

- (void)show;//弹起方法

- (void)dismiss;//消失方法

@end

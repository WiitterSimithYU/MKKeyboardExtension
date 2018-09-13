//
//  MKKeyboardShow.h
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MKKeyboardShowMarco.h"

@interface MKKeyboardShow : NSObject

//初始化方法
SINGLETON_INTERFACE

//动画的枚举方法

typedef NS_ENUM(NSUInteger, MKKeyboardShowStyle) {
    // Various style according to animation
    MKKeyboardShowStyleDefault, //默认的弹出样式 从底部弹出
    
};

typedef NS_ENUM(NSUInteger, MKKeyboardShowViewStyle) {
    
#pragma mark - 如果需要扩展弹出的样式 请在枚举中添加自己的方法
    // Various style according to animation
    MKKeyboardShowViewStyleDefault, //普通的弹出样式
    MKKeyboardShowViewStyleImage, //左侧图片的弹出样式
    MKKeyboardShowViewStyleAt,//左侧带at按钮的弹出样式
    MKKeyboardShowViewStyleAtImage,//左侧带at按钮和图片按钮的弹出样式
};


//设置初始的键盘头弹出样式
+ (void)setDefaultMKKeyboardShowStyle:(MKKeyboardShowStyle)keyboardShowStyle;

//设置初始的键盘头视图的样式
+ (void)setDefaultMKKeyboardShowViewStyle:(MKKeyboardShowViewStyle)showViewStyle;

/**
 设置默认的一些必要参数
 
 @param placeholder 提示内容
 @param buttonTitle 按钮的名称
 @param buttonTitleFont 按钮名字的字体大小
 @param buttonBackGroundColor 按钮的背景色
 @param buttonTitleColor 按钮的字体颜色
 */
+ (void)setDefaultShowViewPlaceholder:(NSString *)placeholder
                          buttonTitle:(NSString *)buttonTitle
                      buttonTitleFont:(CGFloat)buttonTitleFont
                buttonBackGroundColor:(UIColor *)buttonBackGroundColor
                     buttonTitleColor:(UIColor *)buttonTitleColor;


#pragma mark - 本类的初始化方法主要用于显示弹框

/**
 默认的弹出样式
 
 @param content 返回的文本
 */
+ (void)showMkKeyBoardyViewSureCallBack:(void(^_Nullable)(id _Nullable backObject))content;

/**
 带图片选择的弹出样式
 
 @param content 返回的文本
 @param imageSelected 图片选择被点击
 */
+ (void)showMkKeyBoardyImageViewSureCallBack:(void(^_Nullable)(id _Nullable backObject))content
                               imageSelected:(void(^_Nullable)(void))imageSelected;


/**
 带@按钮的弹出样式

 @param content 返回的按钮
 @param atSelected @按钮被点击了
 */
+ (void)showMkKeyBoardAtViewSureallBack:(void(^_Nullable)(id _Nullable backObject))content
                          atSelected:(void(^_Nullable)(void))atSelected;


/**
 带图片和@按钮的弹出样式

 @param content 返回的内容
 @param atSelected @按钮被点击
 @param imageSelected 图片按钮被点击
 */
+ (void)showMkKeyBoardAtImageViewSureallBack:(void(^_Nullable)(id _Nullable backObject))content
                             atSelected:(void(^_Nullable)(void))atSelected
                          imageSelected:(void(^_Nullable)(void))imageSelected;

//展示我要的界面
+ (void)show;

//隐藏界面
+ (void)dismiss;

#pragma mark - 可以自已定义的属性
//设置初始的键盘头弹出样式
@property (assign, nonatomic,setter = setDefaultShowStyle:) MKKeyboardShowStyle keyboardShowStyle;
//设置初始的键盘头视图的样式
@property (assign, nonatomic,setter = setDefaultViewStyle:) MKKeyboardShowViewStyle showViewStyle;
//提示内容
@property (strong, nonatomic) NSString *placeholderString;
//按钮的名称
@property (strong, nonatomic) NSString *buttonTitle;
//按钮名字的字体大小
@property (assign, nonatomic) CGFloat buttonTitleFont;
//按钮的背景色
@property (strong, nonatomic) UIColor *buttonBackGroundColor;
//按钮的字体颜色
@property (strong, nonatomic) UIColor *buttonTitleColor;

#pragma mark - 自有类方法 (不可设置的方法)

@end

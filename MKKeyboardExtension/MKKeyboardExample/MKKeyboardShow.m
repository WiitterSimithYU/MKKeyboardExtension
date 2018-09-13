//
//  MKKeyboardShow.m
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import "MKKeyboardShow.h"
#import "MKKeyboardView.h"
#import "MKKeyboardDefaultTopView.h"
#import "MKKeyboardImageView.h"
#import "MKKeyboardAtView.h"
#import "MKKeyboardImageAtView.h"
#import "AppDelegate.h"
#import "Masonry.h"

@interface MKKeyboardShow()

@property (strong, nonatomic) MKKeyboardView *keyboardView;

@property (strong, nonatomic) MKKeyboardDefaultTopView *defaultTopView;

@property (strong, nonatomic) MKKeyboardImageView *imageTopView;

@property (strong, nonatomic) MKKeyboardAtView *atTopView;

@property (strong, nonatomic) MKKeyboardImageAtView *atImageTopView;

@end

@implementation MKKeyboardShow

static MKKeyboardShow *singleton;
SINGLETON_IMPLEMENTATION(singleton)

- (MKKeyboardView *)keyboardView {
    if (!_keyboardView) {
        _keyboardView = [MKKeyboardView new];
    }
    return _keyboardView;
}

#pragma mark - lazyInit

- (MKKeyboardDefaultTopView *)defaultTopView {
    if(!_defaultTopView) {
        _defaultTopView = [MKKeyboardDefaultTopView new];
        [_defaultTopView setNeedsLayout];
    }
    return _defaultTopView;
}

- (MKKeyboardImageView *)imageTopView {
    if (!_imageTopView) {
        _imageTopView = [MKKeyboardImageView new];
    }
    return _imageTopView;
}

- (MKKeyboardAtView *)atTopView {
    if(!_atTopView) {
        _atTopView = [MKKeyboardAtView new];
    }
    return _atTopView;
}

- (MKKeyboardImageAtView *)atImageTopView {
    if (!_atImageTopView) {
        _atImageTopView = [MKKeyboardImageAtView new];
    }
    return _atImageTopView;
}

+ (void)setDefaultMKKeyboardShowStyle:(MKKeyboardShowStyle)keyboardShowStyle {
    [[MKKeyboardShow sharedInstance] setDefaultShowStyle:keyboardShowStyle];
}

+ (void)setDefaultMKKeyboardShowViewStyle:(MKKeyboardShowViewStyle)showViewStyle {
    [[MKKeyboardShow sharedInstance] setDefaultViewStyle:showViewStyle];
}

+ (void)setDefaultShowViewPlaceholder:(NSString *)placeholder
                          buttonTitle:(NSString *)buttonTitle
                      buttonTitleFont:(CGFloat)buttonTitleFont
                buttonBackGroundColor:(UIColor *)buttonBackGroundColor
                     buttonTitleColor:(UIColor *)buttonTitleColor {
    [[MKKeyboardShow sharedInstance] setPlaceholderString:placeholder];
    [[MKKeyboardShow sharedInstance] setButtonTitle:buttonTitle];
    [[MKKeyboardShow sharedInstance] setButtonTitleFont:buttonTitleFont];
    [[MKKeyboardShow sharedInstance] setButtonBackGroundColor:buttonBackGroundColor];
    [[MKKeyboardShow sharedInstance] setButtonTitleColor:buttonTitleColor];
}

+ (nonnull UIView *)getRootView {
    //获取最初界面
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIView *view = appDelegate.window.viewForLastBaselineLayout;
    return view;
}

- (void)setDefaultShowStyle:(MKKeyboardShowStyle)keyboardShowStyle {
    _keyboardShowStyle = keyboardShowStyle;
}

- (void)setDefaultViewStyle:(MKKeyboardShowViewStyle)showViewStyle {
    _showViewStyle = showViewStyle;
}

- (void)setPlaceholderString:(NSString *)placeholderString {
    _placeholderString = placeholderString;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
}

- (void)setButtonTitleFont:(CGFloat)buttonTitleFont {
    _buttonTitleFont = buttonTitleFont;
}

- (void)setButtonBackGroundColor:(UIColor *)buttonBackGroundColor {
    _buttonBackGroundColor = buttonBackGroundColor;
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor {
    _buttonTitleColor = buttonTitleColor;
}


+ (void)showMkKeyBoardyViewSureCallBack:(void(^_Nullable)(id _Nullable backObject))content {
    
    [[self getRootView] addSubview:[MKKeyboardShow sharedInstance].keyboardView];
    
    [[MKKeyboardShow sharedInstance].keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [[MKKeyboardShow sharedInstance].keyboardView addSubview:[MKKeyboardShow sharedInstance].defaultTopView];
    
    [[MKKeyboardShow sharedInstance].defaultTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(KEYBOARDTOP_HEIGHT);
    }];
    
    [[MKKeyboardShow sharedInstance].defaultTopView setPlaceholderString:[MKKeyboardShow sharedInstance].placeholderString];
    
    [[MKKeyboardShow sharedInstance].defaultTopView setButtonTitle:[MKKeyboardShow sharedInstance].buttonTitle];
    
    [[MKKeyboardShow sharedInstance].defaultTopView setButtonTitleFont:[MKKeyboardShow sharedInstance].buttonTitleFont];
    
    [[MKKeyboardShow sharedInstance].defaultTopView setButtonBackGroundColor:[MKKeyboardShow sharedInstance].buttonBackGroundColor];
    
    [[MKKeyboardShow sharedInstance].defaultTopView setButtonTitleColor:[MKKeyboardShow sharedInstance].buttonTitleColor];
    
    [[MKKeyboardShow sharedInstance].keyboardView setBackGroundDidSelected:^{
        [MKKeyboardShow dismiss];
    }];
    
    [[MKKeyboardShow sharedInstance].defaultTopView setSureButtonHandle:^(NSString *text) {
        content(text);
        [MKKeyboardShow dismiss];
    }];
}

+ (void)showMkKeyBoardyImageViewSureCallBack:(void(^_Nullable)(id _Nullable backObject))content
                               imageSelected:(void(^_Nullable)(void))imageSelected{
    
    [[self getRootView] addSubview:[MKKeyboardShow sharedInstance].keyboardView];
    
    [[MKKeyboardShow sharedInstance].keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [[MKKeyboardShow sharedInstance].keyboardView addSubview:[MKKeyboardShow sharedInstance].imageTopView];
    
    [[MKKeyboardShow sharedInstance].imageTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(KEYBOARDTOP_HEIGHT);
    }];
    
    [[MKKeyboardShow sharedInstance].imageTopView setPlaceholderString:[MKKeyboardShow sharedInstance].placeholderString];
    
    [[MKKeyboardShow sharedInstance].imageTopView setButtonTitle:[MKKeyboardShow sharedInstance].buttonTitle];
    
    [[MKKeyboardShow sharedInstance].imageTopView setButtonTitleFont:[MKKeyboardShow sharedInstance].buttonTitleFont];
    
    [[MKKeyboardShow sharedInstance].imageTopView setButtonBackGroundColor:[MKKeyboardShow sharedInstance].buttonBackGroundColor];
    
    [[MKKeyboardShow sharedInstance].imageTopView setButtonTitleColor:[MKKeyboardShow sharedInstance].buttonTitleColor];
    
    [[MKKeyboardShow sharedInstance].keyboardView setBackGroundDidSelected:^{
        [MKKeyboardShow dismiss];
    }];
    
    [[MKKeyboardShow sharedInstance].imageTopView setImageButtonHandle:^{
        [MKKeyboardShow dismiss];
        imageSelected();
    }];
    
    [[MKKeyboardShow sharedInstance].imageTopView setSureButtonHandle:^(NSString *text) {
        content(text);
        [MKKeyboardShow dismiss];
    }];
}

+ (void)showMkKeyBoardAtViewSureallBack:(void(^_Nullable)(id _Nullable backObject))content
                             atSelected:(void(^_Nullable)(void))atSelected {
    [[self getRootView] addSubview:[MKKeyboardShow sharedInstance].keyboardView];
    
    [[MKKeyboardShow sharedInstance].keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [[MKKeyboardShow sharedInstance].keyboardView addSubview:[MKKeyboardShow sharedInstance].atTopView];
    
    [[MKKeyboardShow sharedInstance].atTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(KEYBOARDTOP_HEIGHT);
    }];
    
    [[MKKeyboardShow sharedInstance].atTopView setPlaceholderString:[MKKeyboardShow sharedInstance].placeholderString];
    
    [[MKKeyboardShow sharedInstance].atTopView setButtonTitle:[MKKeyboardShow sharedInstance].buttonTitle];
    
    [[MKKeyboardShow sharedInstance].atTopView setButtonTitleFont:[MKKeyboardShow sharedInstance].buttonTitleFont];
    
    [[MKKeyboardShow sharedInstance].atTopView setButtonBackGroundColor:[MKKeyboardShow sharedInstance].buttonBackGroundColor];
    
    [[MKKeyboardShow sharedInstance].atTopView setButtonTitleColor:[MKKeyboardShow sharedInstance].buttonTitleColor];
    
    [[MKKeyboardShow sharedInstance].keyboardView setBackGroundDidSelected:^{
        [MKKeyboardShow dismiss];
    }];
    
    [[MKKeyboardShow sharedInstance].atTopView setSureButtonHandle:^(NSString *text) {
        content(text);
        [MKKeyboardShow dismiss];
    }];
    
    [[MKKeyboardShow sharedInstance].atTopView setAtButtonHandle:^{
        atSelected();
        [MKKeyboardShow dismiss];
    }];
    
}

+ (void)showMkKeyBoardAtImageViewSureallBack:(void(^_Nullable)(id _Nullable backObject))content
                                  atSelected:(void(^_Nullable)(void))atSelected
                               imageSelected:(void(^_Nullable)(void))imageSelected {
    [[self getRootView] addSubview:[MKKeyboardShow sharedInstance].keyboardView];
    
    [[MKKeyboardShow sharedInstance].keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [[MKKeyboardShow sharedInstance].keyboardView addSubview:[MKKeyboardShow sharedInstance].atImageTopView];
    
    [[MKKeyboardShow sharedInstance].atImageTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(KEYBOARDTOP_HEIGHT);
    }];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setPlaceholderString:[MKKeyboardShow sharedInstance].placeholderString];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setButtonTitle:[MKKeyboardShow sharedInstance].buttonTitle];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setButtonTitleFont:[MKKeyboardShow sharedInstance].buttonTitleFont];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setButtonBackGroundColor:[MKKeyboardShow sharedInstance].buttonBackGroundColor];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setButtonTitleColor:[MKKeyboardShow sharedInstance].buttonTitleColor];
    
    [[MKKeyboardShow sharedInstance].keyboardView setBackGroundDidSelected:^{
        [MKKeyboardShow dismiss];
    }];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setSureButtonHandle:^(NSString *text) {
        content(text);
        [MKKeyboardShow dismiss];
    }];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setAtButtonHandle:^{
        atSelected();
        [MKKeyboardShow dismiss];
    }];
    
    [[MKKeyboardShow sharedInstance].atImageTopView setImageButtonHandle:^{
        imageSelected();
        [MKKeyboardShow dismiss];
    }];
    
}

+ (void)show {
    
    switch ([MKKeyboardShow sharedInstance].showViewStyle) {
        case MKKeyboardShowViewStyleDefault:
        {
            [[MKKeyboardShow sharedInstance].defaultTopView show];
        }
            break;
        case MKKeyboardShowViewStyleImage:
        {
            [[MKKeyboardShow sharedInstance].imageTopView show];
        }
            break;
        case MKKeyboardShowViewStyleAt:
        {
            [[MKKeyboardShow sharedInstance].atTopView show];
        }
            break;
        case MKKeyboardShowViewStyleAtImage:
        {
            [[MKKeyboardShow sharedInstance].atImageTopView show];
        }
            break;
    }
}

+ (void)dismiss {
    [[MKKeyboardShow sharedInstance].keyboardView removeFromSuperview];
    if ([MKKeyboardShow sharedInstance].keyboardView) {
        [MKKeyboardShow sharedInstance].keyboardView = nil;
    }
}

@end

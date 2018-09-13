//
//  MKKeyboardDefaultTopView.m
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import "MKKeyboardDefaultTopView.h"
#import "Masonry.h"

@interface MKKeyboardDefaultTopView()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) UIButton *sureButton;

@end

@implementation MKKeyboardDefaultTopView

#pragma mark - lazyInit

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        [_textField setDelegate:self];
    }
    return _textField;
}

- (UIButton *)sureButton {
    if (!_sureButton) {
        _sureButton = [UIButton new];
        [_sureButton addTarget:self action:@selector(sureButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}

#pragma mark - setter

- (void)setPlaceholderString:(NSString *)placeholderString {
    _placeholderString = placeholderString;
    self.textField.placeholder = placeholderString;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    _buttonTitle = buttonTitle;
    [self.sureButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setButtonTitleFont:(CGFloat)buttonTitleFont {
    _buttonTitleFont = buttonTitleFont;
    self.sureButton.titleLabel.font = [UIFont systemFontOfSize:buttonTitleFont];
}

- (void)setButtonBackGroundColor:(UIColor *)buttonBackGroundColor {
    _buttonBackGroundColor = buttonBackGroundColor;
    self.sureButton.backgroundColor = buttonBackGroundColor;
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor {
    _buttonTitleColor = buttonTitleColor;
    self.sureButton.titleLabel.textColor = buttonTitleColor;
}

#pragma mark - init
- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialControl];
    }
    return self;
}

- (void)initialControl {
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.textField];
    [self addSubview:self.sureButton];
    
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.bottom.mas_equalTo(0);
        make.right.equalTo(self.sureButton.mas_left).offset(8);
    }];
}

- (void)show {
    [self.textField becomeFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

- (void)sureButtonAction:(id)sender {
    [self.textField  resignFirstResponder];
    _sureButtonHandle ? _sureButtonHandle(self.textField.text) : nil;
    [self removeFromSuperview];
}

- (void)dismiss {
    [self removeFromSuperview];
}

@end

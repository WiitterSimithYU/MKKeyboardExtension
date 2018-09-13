//
//  MKKeyboardAtView.m
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/12.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import "MKKeyboardAtView.h"
#import "Masonry.h"

@interface MKKeyboardAtView()<UITextFieldDelegate>

@property (strong, nonatomic) UIButton *atButton;

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) UIButton *sureButton;

@end

@implementation MKKeyboardAtView

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField .delegate = self;
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

- (UIButton *)atButton {
    if (!_atButton) {
        _atButton = [UIButton new];
        [_atButton setTitle:@"@" forState:UIControlStateNormal];
        [_atButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_atButton addTarget:self action:@selector(atButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _atButton;
}

- (void)setPlaceholderString:(NSString *)placeholderString {
    self.textField.placeholder = placeholderString;
}

- (void)setButtonTitle:(NSString *)buttonTitle {
    [self.sureButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setButtonTitleFont:(CGFloat)buttonTitleFont {
    self.sureButton.titleLabel.font = [UIFont systemFontOfSize:buttonTitleFont];
}

- (void)setButtonBackGroundColor:(UIColor *)buttonBackGroundColor {
    self.sureButton.backgroundColor = buttonBackGroundColor;
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor {
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
    
    [self addSubview:self.sureButton];
    [self addSubview:self.atButton];
    [self addSubview:self.textField];
    
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
    
    [self.atButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(45);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.atButton.mas_right).offset(8);
        make.top.bottom.mas_equalTo(0);
        make.right.equalTo(self.sureButton.mas_left).offset(8);
    }];
}

- (void)show {
    [self.textField becomeFirstResponder];
}

- (void)sureButtonAction:(id)sender {
    [self.textField  resignFirstResponder];
    if (self.sureButtonHandle) {
        self.sureButtonHandle(self.textField.text);
    }
    [self removeFromSuperview];
}

- (void)atButtonAction:(id)sender {
    if (self.atButtonHandle) {
        self.atButtonHandle();
    }
    [self removeFromSuperview];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

@end

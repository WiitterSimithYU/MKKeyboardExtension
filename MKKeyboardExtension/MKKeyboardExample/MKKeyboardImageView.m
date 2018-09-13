//
//  MKKeyboardImageView.m
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/11.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import "MKKeyboardImageView.h"
#import "Masonry.h"

@interface MKKeyboardImageView()<UITextFieldDelegate>

@property (strong, nonatomic) UIButton *imageButton;

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) UIButton *sureButton;

@end

@implementation MKKeyboardImageView

- (UIButton *)imageButton {
    if (!_imageButton) {
        _imageButton = [UIButton new];
        [_imageButton setImage:[UIImage imageNamed:@"picture"] forState:UIControlStateNormal];
        [_imageButton addTarget:self action:@selector(imageButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _imageButton;
}

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

- (void)setButtonImage:(UIImage *)buttonImage {
     [self.imageButton setImage:buttonImage forState:UIControlStateNormal];
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
    
    [self addSubview:self.imageButton];
    [self addSubview:self.textField];
    [self addSubview:self.sureButton];
    
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
    
    [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(45);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageButton.mas_right).offset(8);
        make.top.bottom.mas_equalTo(0);
        make.right.equalTo(self.sureButton.mas_left).offset(8);
    }];
}

- (void)show {
    [self.textField becomeFirstResponder];
}

- (void)imageButtonAction:(id)sender {
    if (self.imageButtonHandle) {
        self.imageButtonHandle();
    }
    [self removeFromSuperview];
}

- (void)sureButtonAction:(id)sender {
    [self.textField  resignFirstResponder];
    if (self.sureButtonHandle) {
        self.sureButtonHandle(self.textField.text);
    }
    [self removeFromSuperview];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

@end

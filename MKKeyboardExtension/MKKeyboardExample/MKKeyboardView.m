//
//  MKKeyboardView.m
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import "MKKeyboardView.h"
#import "MKKeyboardDefaultTopView.h"
#import "MKKeyboardImageView.h"
#import "Masonry.h"


@interface MKKeyboardView()

@property (strong, nonatomic) MKKeyboardDefaultTopView *defaultTopView;

@property (strong, nonatomic) MKKeyboardImageView *imageTopView;

@property (assign, nonatomic) CGFloat keyBoardyheight;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewCOnstraintBottom;

@end

@implementation MKKeyboardView

#pragma mark - init

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
    
    self.backgroundColor = [UIColor clearColor];
    
    //使用NSNotificationCenter 鍵盤出現時
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    //使用NSNotificationCenter 鍵盤隐藏時
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    [self addTarget:self action:@selector(backgroundBeDidSelected) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backgroundBeDidSelected {
    _backGroundDidSelected ? _backGroundDidSelected() : nil;
}

- (void)keyboardWillShown:(NSNotification*)aNotification {
    NSDictionary *info = [aNotification userInfo];
    CGFloat curkeyBoardHeight = [[[aNotification userInfo] objectForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue].size.height;
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];

    [UIView animateWithDuration:duration animations:^{
        [self setTransform:CGAffineTransformMakeTranslation(0, -curkeyBoardHeight)];
    }];
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    
}

@end

//
//  MKKeyboardImageView.h
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/11.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKKeyboardDefaultTopView.h"

@interface MKKeyboardImageView : MKKeyboardDefaultTopView

@property (strong, nonatomic) UIImage *buttonImage;

@property (copy, nonatomic) void (^imageButtonHandle)();

@end

//
//  MKKeyboardView.h
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKKeyboardShow.h"
#import "MKKeyboardShowMarco.h"

@interface MKKeyboardView : UIControl

- (void)backgroundBeDidSelected;

@property (copy, nonatomic) void (^backGroundDidSelected)();

@end

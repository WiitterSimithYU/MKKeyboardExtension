//
//  MKKeyboardAtView.h
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/12.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKKeyboardDefaultTopView.h"

@interface MKKeyboardAtView : MKKeyboardDefaultTopView

@property (copy, nonatomic) void (^atButtonHandle)();

@end

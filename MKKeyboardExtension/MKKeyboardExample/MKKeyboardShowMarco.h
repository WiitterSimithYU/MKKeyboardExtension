//
//  MKKeyboardShowMarco.h
//  MKKeyboardExtension
//
//  Created by 比由技术工场 on 2018/9/10.
//  Copyright © 2018年 com.biu.mark. All rights reserved.
//

#ifndef MKKeyboardShowMarco_h
#define MKKeyboardShowMarco_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//block weak self
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define KEYBOARDTOP_HEIGHT 45

//singleton
#define SINGLETON_INTERFACE + (nonnull instancetype)sharedInstance;
#define SINGLETON_IMPLEMENTATION(singleton) + (nonnull instancetype)sharedInstance { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
singleton = [[[self class] alloc] init]; \
}); \
return singleton; \
} \
\
+ (nonnull instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
singleton = [super allocWithZone:zone]; \
}); \
return singleton; \
} \
\
- (nonnull id)copyWithZone:(NSZone *)zone { \
return singleton; \
} \

#endif /* MKKeyboardShowMarco_h */

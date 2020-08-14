//
//  ViewController+LGHook.m
//  05-Runtime应用
//
//  Created by cooci on 2018/11/29.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "ViewController+LGHook.h"
#import <objc/runtime.h>

@implementation ViewController (LGHook)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method m1 = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method m2 = class_getInstanceMethod(self, @selector(lg_viewWillAppear:));
        method_exchangeImplementations(m1, m2);
    });
    
}

- (void)lg_viewWillAppear:(BOOL) animated {
    NSLog(@"%s", __func__);
    [self lg_viewWillAppear:animated];
}

@end

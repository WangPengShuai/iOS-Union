//
//  NSObject+LGKC.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/29.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "NSObject+LGKC.h"
#import <objc/runtime.h>

void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" >> dynamicMethodIMP");
}

@implementation NSObject (LGKC)

//+ (void)run{
//    NSLog(@"nsobject run +++ ");
//}
//
//
//- (void)run{
//    NSLog(@"nsobject run");
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    NSLog(@"NSObject+LGKC == %s",__func__);
//    if (sel == @selector(walk)) {
//        class_addMethod([self class], sel, (IMP) dynamicMethodIMP, "v@:");
//        return YES;
//    }
//    return NO;
//}
@end

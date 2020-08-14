//
//  LGPerson.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "LGPerson.h"
#include <objc/runtime.h>

@implementation LGPerson

- (void)readBook{
    NSLog(@"%s",__func__);
}
+ (void)helloWord{
    NSLog(@"%s",__func__);
}
//- (void)run{
//    NSLog(@"%s",__func__);
//}
+ (void)walk{
    NSLog(@"%s",__func__);
}
// .m没有实现,并且父类也没有,那么我们就开启下面的动态方法解析

#pragma mark - 动态方法解析

//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(run)) {
//        // 我们动态解析我们的 对象方法
//        NSLog(@"对象方法解析走这里");
//        SEL readSEL = @selector(readBook);
//        Method readM= class_getInstanceMethod(self, readSEL);
//        IMP readImp = method_getImplementation(readM);
//        const char *type = method_getTypeEncoding(readM);
//        return class_addMethod(self, sel, readImp, type);
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//
//+ (BOOL)resolveClassMethod:(SEL)sel{
//    if (sel == @selector(walk)) {
//        // 我们动态解析我们的 对象方法
//        NSLog(@"类方法解析走这里");
//        SEL hellowordSEL = @selector(helloWord);
//        // 类方法就存在我们的元类的方法列表
//        // 类 类犯法
//        // 元类 对象实例方法
//        Method hellowordM1= class_getClassMethod(self, hellowordSEL);
//        Method hellowordM= class_getInstanceMethod(object_getClass(self), hellowordSEL);
//        IMP hellowordImp = method_getImplementation(hellowordM);
//        const char *type = method_getTypeEncoding(hellowordM);
//        NSLog(@"%s",type);
//        return class_addMethod(object_getClass(self), sel, hellowordImp, type);
//    }
//    return [super resolveClassMethod:sel];
//}



@end

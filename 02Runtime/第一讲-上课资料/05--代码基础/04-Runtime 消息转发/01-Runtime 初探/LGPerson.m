//
//  LGPerson.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "LGPerson.h"
#import "LGStudent.h"
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
//+ (void)walk{
//    NSLog(@"%s",__func__);
//}
// .m没有实现,并且父类也没有,那么我们就开启下面的动态方法解析

#pragma mark - 动态方法解析

+ (BOOL)resolveInstanceMethod:(SEL)sel{

    return [super resolveInstanceMethod:sel];
}


+ (BOOL)resolveClassMethod:(SEL)sel{

    return [super resolveClassMethod:sel];
}

#pragma mark - 消息转发

- (id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"%s",__func__);
//    if (aSelector == @selector(run)) {
//        // 转发给我们的LGStudent 对象
//        return [LGStudent new];
//    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSLog(@"%s",__func__);
    if (aSelector == @selector(run)) {
        // forwardingTargetForSelector 没有实现 就只能方法签名了
        Method method    = class_getInstanceMethod(object_getClass(self), @selector(readBook));
        const char *type = method_getTypeEncoding(method);
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"%s",__func__);
    NSLog(@"------%@-----",anInvocation);
    anInvocation.selector = @selector(readBook);
    [anInvocation invoke];
}

#pragma mark - 类消息转发

// 只有汇编调用  没有源码实现

+ (id)forwardingTargetForSelector:(SEL)aSelector{
    // 自定义处理 -- crash
    // 防止奔溃
    NSLog(@"%s",__func__);
    return [super forwardingTargetForSelector:aSelector];
}
//

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSLog(@"%s",__func__);
    if (aSelector == @selector(walk)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"%s",__func__);
    
    // walk anInvocation --
    // 系统调用堆栈
    // 沙盒 -- 服务器
    
    // 切面编程
    // 家庭作业 aspect -- 消息转发代码
    
    // method-swizzling hook array 数组越界
    // self.dataArray objecAtIndex
    // if index < self.count-1 -- excepetion
    // 消息转发
    // array nil
    // 切面
    
    NSString *sto = @"奔跑少年";
    anInvocation.target = [LGStudent class];
    [anInvocation setArgument:&sto atIndex:2];
    NSLog(@"%@",anInvocation.methodSignature);
    anInvocation.selector = @selector(run:);
    [anInvocation invoke];
}



@end

//
//  main.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGStudent.h"
#include <objc/message.h> // 看到这个斜杠我们就知道runtime不在runtime文件 在objc文件

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         typedef struct objc_object LGPerson; 对象的本质就是结构体
         每个对象的底层都有一个implist
         struct LGPerson_IMPL {
         struct NSObject_IMPL NSObject_IVARS;
         };
         */
        LGStudent *s = [LGStudent new];
        [s run];
        // 方法调用底层编译
        // 方法的本质: 消息 : 消息接受者 消息编号 ....参数 (消息体)
        objc_msgSend(s, sel_registerName("run"));
        // runtime
        NSLog(@"%p -- %p",sel_registerName("run"),@selector(run));
        // 类方法编译底层
        id cls = [LGStudent class];
        void *pointA = &cls;
        [(__bridge id)pointA walk];
        objc_msgSend(objc_getClass("LGStudent"), sel_registerName("walk"));
        
        // 向父类发消息(对象方法)
        struct objc_super mySuper;
        mySuper.receiver = s;
        mySuper.super_class = class_getSuperclass([s class]);
        objc_msgSendSuper(&mySuper, @selector(run));
//
        //向父类发消息(类方法)
        struct objc_super myClassSuper;
        myClassSuper.receiver = [s class];
        myClassSuper.super_class = class_getSuperclass(object_getClass([s class]));// 元类
        objc_msgSendSuper(&myClassSuper, sel_registerName("walk"));
        
        // 对象方法存在哪
        // 类方法存在哪
        
        // 类方法 元类 --- 姿态 实例方法
        // 对象 在 类  实例
        // 类 在元类   实例
        

    }
    return 0;
}

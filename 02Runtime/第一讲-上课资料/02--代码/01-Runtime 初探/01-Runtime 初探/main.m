//
//  main.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGStudent.h"
#include <objc/runtime.h> 


// 代码 ---> 编译链接 ---> 执行
// 对于C函数就是静态性,我编译如果不存在这个run函数,就会报错,但是OC不一样

// 上 -- 下
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // OC 对象 -- 本质 --- 结构体
        // clang
        LGPerson *p = [[LGPerson alloc] init];
        //   LGPerson *p = ((LGPerson *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("LGPerson"), sel_registerName("new"));
        // objc_msgSend ?
        // 方法的本质 --- 发送消息
        // 消息的组成
        // ((void (*)(id, SEL))(void *)objc_msgSend)((id)p, sel_registerName("run"));
        // void *)objc_msgSend)((id)p 消息接受者
        // sel_registerName("run")  方法编号 --- name
        // imp 函数实现的指针 -- sel -> imp ?
        // 下层通讯  方法 -- 对象  类
        // 父类发送消息
        // github 写了注释的代码
        [p run];
  
    }
    return 0;
}

void runIMP(id self,SEL _cmd){
    
}

//
//  main.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGStudent.h"
#include <objc/runtime.h> // 看到这个斜杠我们就知道runtime不在runtime文件 在objc文件


struct method_t {
    SEL name;
    const char *types;
    IMP imp;
    
    // 因为下面是不是指针,所以我可以先删除,不关系
//    struct SortBySELAddress :
//    public std::binary_function<const method_t&,
//    const method_t&, bool>
//    {
//        bool operator() (const method_t& lhs,
//                         const method_t& rhs)
//        { return lhs.name < rhs.name; }
//    };
};

// 代码 ---> 编译链接 ---> 执行
// 对于C函数就是静态性,我编译如果不存在这个run函数,就会报错,但是OC不一样
void run(){
    NSLog(@"%s",__func__);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LGPerson *p = [LGPerson new];
        LGStudent*s = [LGStudent new];
        [p run];
        [s walk]; // 学生本身没有walk方法,但是就是不报错 都知道我们多态 --- 会指向我们的父类,去找相应实现
        // 除了这样我们还可以玩玩runtime
        
        struct method_t *m1 = class_getInstanceMethod([p class], @selector(run));
        struct method_t *m2 = class_getInstanceMethod([p class], @selector(walk));
        
        //        IMP imp = method_getImplementation(m1);
        //        method_setImplementation(m1, m2->imp);
        method_setImplementation(m1, (IMP)run); // 指向C函数
        [p run];
        // 刚刚不是介绍过除了runtime 提供的ipa 是不是还可以玩源码
        
        // isa 指针指向子类 ,调用person 结果student接受
        object_setClass(p, [s class]);
        [p run];
    }
    return 0;
}

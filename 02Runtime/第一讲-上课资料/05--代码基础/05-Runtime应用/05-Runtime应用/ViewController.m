//
//  ViewController.m
//  05-Runtime应用
//
//  Created by cooci on 2018/11/29.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "ViewController.h"
#import "LGPerson.h"
#import "LGKCArchiveTool.h"
#import "ViewController+LGHook.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    LGPerson *p = [LGPerson new];
    p.name = @"Cooci";
    p.age  = 18;
    p.nick = @"KC";

    // 归档
    [LGKCArchiveTool lg_archiveObject:p prefix:NSStringFromClass(LGPerson.class)];

    // 这个data可以写文件
    // 解档
    LGPerson *p2 = [LGKCArchiveTool lg_unarchiveClass:[LGPerson class] prefix:NSStringFromClass(LGPerson.class)];
    NSLog(@"name = %@, age = %d", p2.name, p2.age);


}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self classTest];
}

void hunting(id self, SEL _cmd) {
    NSLog(@"%s", __func__);
}


- (void)classTest {
    
    /// 创建一类对
    Class LGCat = objc_allocateClassPair([NSObject class], "LGCat", 0);
    
    /// 添加实例变量
    // const char* types= "v@:"
    NSString* name = @"name";
    class_addIvar(LGCat, name.UTF8String, sizeof(id), log2(sizeof(id)), @encode(id));

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    // 添加方法
    class_addMethod(LGCat, @selector(hunting), (IMP)hunting, "v@:");
    
     /// 注册类
    objc_registerClassPair(LGCat);

    // 创建实例对象
    id cat = [[LGCat alloc] init];
    [cat setValue:@"Tom" forKey:@"name"];
    NSLog(@"name = %@", [cat valueForKey:name]);
    
    /// 方法调用
    [cat performSelector:@selector(hunting)];
#pragma clang diagnostic pop
    
}


@end

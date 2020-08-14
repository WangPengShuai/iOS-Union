//
//  ViewController.m
//  06-Runtime应用-页面跳转
//
//  Created by cooci on 2019/2/25.
//  Copyright © 2019 cooci. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

@interface ViewController ()
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.view.backgroundColor = [UIColor redColor];

    self.dataArray = @[@{@"class":@"LGRedViewController",
                         @"data":@{@"name":@"cooci-18",
                                   @"backgroundColor":@"red"}},
                       @{@"class":@"LGGreenViewController",
                         @"data":@{@"slogan":@"和谐学习,不急不躁",
                                   @"backgroundColor":@"green"}},
                       @{@"class":@"LGOrangeViewController",
                         @"data":@{@"ending":@"我就是我,颜色不一样的烟火",
                                   @"backgroundColor":@"orange"}}];
    
}
- (IBAction)gotoRedVC:(id)sender {
    [self pushToAnyVCWithData:self.dataArray[0]];
}

- (IBAction)gotoGreenVC:(id)sender {
    [self pushToAnyVCWithData:self.dataArray[1]];

}
- (IBAction)gotoOrangeVC:(id)sender {
    [self pushToAnyVCWithData:self.dataArray[2]];

}


- (void)pushToAnyVCWithData:(NSDictionary *)dataDict{
    //
    const char *clsName = [dataDict[@"class"] UTF8String];
    Class cls = objc_getClass(clsName);
    // 1: 创建类
    if (!cls) {
        Class superClass = [UIViewController class];
        cls  = objc_allocateClassPair(superClass, clsName, 0);
        class_addIvar(cls, "ending", sizeof(NSString *), log2(sizeof(NSString *)), @encode(NSString *));
        class_addIvar(cls, "show_lb", sizeof(UILabel *), log2(sizeof(UILabel *)), @encode(UILabel *));
        objc_registerClassPair(cls);
        
        Method method = class_getInstanceMethod([self class], @selector(lg_instancemethod));
        IMP methodIMP = method_getImplementation(method);
        const char *types = method_getTypeEncoding(method);
        BOOL rest = class_addMethod(cls, @selector(viewDidLoad), methodIMP, types);
        NSLog(@"rest == %d",rest);
    }
    
    // 实例化对象
    id instance = nil;
    @try {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        instance = [sb instantiateViewControllerWithIdentifier:dataDict[@"class"]];
    } @catch (NSException *exception) {
        
        instance = [[cls alloc] init];
    } @finally {
        NSLog(@"OK");
    }
    
    NSDictionary *dict = dataDict[@"data"];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        // 检测是否存在key的属性
        if (class_getProperty(cls, [key UTF8String])) {
            [instance setValue:obj forKey:key];
        }
        // 检测是否存在key的变量
        else if (class_getInstanceVariable(cls, [key UTF8String])){
            [instance setValue:obj forKey:key];
        }
    }];
    
    
    [self.navigationController pushViewController:instance animated:YES];
}

// self ?
// objc_msgSend(id self,)
// self 型参
// self class [super class]
- (void)lg_instancemethod {
    [super viewDidLoad];
    
    [self setValue:[UIColor orangeColor] forKeyPath:@"view.backgroundColor"];
    [self setValue:[[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 30)] forKey:@"show_lb"];
    UILabel *show_lb = [self valueForKey:@"show_lb"];
    [[self valueForKey:@"view"] addSubview:show_lb];
    show_lb.text = [self valueForKey:@"ending"];
    show_lb.font = [UIFont systemFontOfSize:14];
    show_lb.textColor = [UIColor blackColor];
    show_lb.textAlignment = NSTextAlignmentCenter;
    show_lb.backgroundColor = [UIColor whiteColor];
    NSLog(@"hello word");
}

@end

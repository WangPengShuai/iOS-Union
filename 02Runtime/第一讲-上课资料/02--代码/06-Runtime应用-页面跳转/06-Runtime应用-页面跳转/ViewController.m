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
    
}

@end

//
//  LGRedViewController.m
//  06-Runtime应用-页面跳转
//
//  Created by cooci on 2019/2/25.
//  Copyright © 2019 cooci. All rights reserved.
//

#import "LGRedViewController.h"

@interface LGRedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *show_lb;

@end

@implementation LGRedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.show_lb.text = self.name;
}


@end

//
//  LGGreenViewController.m
//  06-Runtime应用-页面跳转
//
//  Created by cooci on 2019/2/25.
//  Copyright © 2019 cooci. All rights reserved.
//

#import "LGGreenViewController.h"

@interface LGGreenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *show_lb;

@end

@implementation LGGreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.show_lb.text = self.slogan;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

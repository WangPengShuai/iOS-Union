//
//  LGStudent.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "LGStudent.h"

@implementation LGStudent
+ (void)run:(NSString *)str{
    NSLog(@"%s --- %@",__func__,str);
}
- (void)walk{
    NSLog(@"%s",__func__);
}

@end

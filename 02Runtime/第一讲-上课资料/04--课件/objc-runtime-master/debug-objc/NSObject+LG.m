//
//  NSObject+LG.m
//  debug-objc
//
//  Created by cooci on 2019/1/23.
//

#import "NSObject+LG.h"

@implementation NSObject (LG)

- (void)lg_message{
    NSLog(@"LG = %s",__func__);
}
@end

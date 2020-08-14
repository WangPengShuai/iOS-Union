//
//  main.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGStudent.h"
#include <objc/message.h> 

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        LGStudent *s = [LGStudent new];
        [s run];
    }
    return 0;
}

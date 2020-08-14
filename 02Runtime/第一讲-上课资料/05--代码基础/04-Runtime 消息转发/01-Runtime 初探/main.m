//
//  main.m
//  01-Runtime 初探
//
//  Created by cooci on 2018/11/27.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGStudent.h"
#include <objc/message.h> // 看到这个斜杠我们就知道runtime不在runtime文件 在objc文件

extern void instrumentObjcMessageSends(BOOL);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        instrumentObjcMessageSends(YES);
        [LGPerson  walk];
        instrumentObjcMessageSends(NO);

    }
    return 0;
}

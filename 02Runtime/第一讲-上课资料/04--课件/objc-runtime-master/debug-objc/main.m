//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "LGPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        [LGPerson lg_message];
        NSLog(@"Hello, World!");

    }
    return 0;
}

//
//  LGPerson.m
//  05-Runtime应用
//
//  Created by cooci on 2018/11/29.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "LGPerson.h"
#import <objc/runtime.h>

@implementation LGPerson

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    Ivar* ivars = class_copyIvarList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar var = ivars[i];
        const char* name = ivar_getName(var);
        NSString* key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self == [super init]) {
        unsigned int count = 0;
        Ivar* ivars = class_copyIvarList([self class], &count);
        
        for (int i = 0; i < count; i++) {
            Ivar var = ivars[i];
            const char* name = ivar_getName(var);
            NSString* key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

+ (BOOL)supportsSecureCoding{
    return YES;
}
@end

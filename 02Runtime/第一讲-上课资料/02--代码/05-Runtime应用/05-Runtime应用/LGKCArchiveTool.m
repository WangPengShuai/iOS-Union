//
//  LGKCArchiveTool.m
//  05-Runtime应用
//
//  Created by cooci on 2018/11/29.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "LGKCArchiveTool.h"

@implementation LGKCArchiveTool

+ (BOOL)lg_archiveObject:(id)object prefix:(NSString *)prefix{
    if (!object)
        return NO;
    NSError *error;
    //会调用对象的encodeWithCoder方法
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object
                                         requiringSecureCoding:NO
                                                         error:&error];
    if (error){
        return NO;
    }
    
    [data writeToFile:[self getPathWithPrefix:prefix] atomically:YES];
    return YES;
}

+ (id)lg_unarchiveClass:(Class)class prefix:(NSString *)prefix{
    
    NSError *error;
    NSData *data = [[NSData alloc] initWithContentsOfFile:[self getPathWithPrefix:prefix]];
    //会调用对象的initWithCoder方法
    id content = [NSKeyedUnarchiver unarchivedObjectOfClass:class fromData:data error:&error];
    if (error) {
        return nil;
    }
    return content;
}


/**
 存放的文件路径
 
 @return return value description
 */
+ (NSString *)getPathWithPrefix:(NSString *)prefix {
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePathFolder = [documentPath stringsByAppendingPaths:@[@"archiveTemp"]].firstObject;
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePathFolder]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *path = [NSString stringWithFormat:@"%@/%@.plist",filePathFolder,prefix];
    return path;
}


@end

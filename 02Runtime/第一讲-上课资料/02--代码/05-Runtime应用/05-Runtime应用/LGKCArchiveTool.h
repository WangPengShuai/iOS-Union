//
//  LGKCArchiveTool.h
//  05-Runtime应用
//
//  Created by cooci on 2018/11/29.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGKCArchiveTool : NSObject
+ (BOOL)lg_archiveObject:(id)object prefix:(NSString *)prefix;
+ (id)lg_unarchiveClass:(Class)class prefix:(NSString *)prefix;
@end

NS_ASSUME_NONNULL_END

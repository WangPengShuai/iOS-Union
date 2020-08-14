//
//  LGPerson.h
//  05-Runtime应用
//
//  Created by cooci on 2018/11/29.
//  Copyright © 2018 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPerson : NSObject<NSSecureCoding>

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* nick;
@property (nonatomic, assign) int age;
@end

NS_ASSUME_NONNULL_END

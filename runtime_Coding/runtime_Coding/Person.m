//
//  Person.m
//  runtime_Coding
//
//  Created by 小蔡 on 16/8/10.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation Person

- (void)encodeWithCoder:(NSCoder *)coder{
    // 计算对象成员变量的个数
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i=0; i<count; ++i) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *ivarName = ivar_getName(ivar);
        
        // 归档
        NSString *key = [NSString stringWithFormat:@"%s", ivarName];
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i=0; i<count; ++i) {
            // 取出i位置对应的成员变量
            Ivar ivar = ivars[i];
            
            // 查看成员变量
            const char *ivarName = ivar_getName(ivar);
            
            // 解档
            NSString *key = [NSString stringWithFormat:@"%s", ivarName];
            [self setValue:[decoder decodeObjectForKey:key] forKey:key];
        }
        free(ivars);
    }
    return self;
}

@end

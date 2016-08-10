//
//  Person.h
//  runtime_Coding
//
//  Created by 小蔡 on 16/8/10.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) float height;

@end

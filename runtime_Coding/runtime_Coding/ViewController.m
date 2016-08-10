//
//  ViewController.m
//  runtime_Coding
//
//  Created by 小蔡 on 16/8/10.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    Person *person = [[Person alloc] init];
    person.name = @"小明";
    person.age = 20;
    person.height = 175.0;
    
    //存储路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", documentPath);
    
    //归档
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"person.dat"];
    [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    
    //解档
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@--%d--%f", p.name, p.age, p.height);
}


@end

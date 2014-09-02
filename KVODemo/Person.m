//
//  Person.m
//  KVODemo
//
//  Created by Ren Guohua on 14-9-2.
//  Copyright (c) 2014年 Ren Guohua. All rights reserved.
//

#import "Person.h"

@implementation Person


static Person *instance = nil;

+ (instancetype)sharePerson{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(id)init
{
    if (self = [super init])
    {
        self.name = @"Alex";
        self.age = @22;
    }
    return self;
}

- (void)changePerson
{
    if ([self.name isEqualToString:@"Alex"])
    {
        [self setValue:@"Lucy" forKey:@"name"];
        [self setValue:@24 forKey:@"age"];
    }
    else
    {
        [self setValue:@"Alex" forKey:@"name"];
        [self setValue:@22 forKey:@"age"];
    }

}


@end

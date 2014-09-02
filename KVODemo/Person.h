//
//  Person.h
//  KVODemo
//
//  Created by Ren Guohua on 14-9-2.
//  Copyright (c) 2014年 Ren Guohua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;


+ (instancetype)sharePerson;

- (void)changePerson;//修改person

@end

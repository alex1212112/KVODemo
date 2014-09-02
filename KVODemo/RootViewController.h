//
//  RootViewController.h
//  KVODemo
//
//  Created by Ren Guohua on 14-9-2.
//  Copyright (c) 2014年 Ren Guohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic, strong) UILabel *nameLabel; //姓名
@property (nonatomic, strong) UILabel *ageLabel;  //年龄
@property (nonatomic, strong) UIButton * changeButton; //按钮改变person

@end

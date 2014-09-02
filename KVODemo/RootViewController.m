//
//  RootViewController.m
//  KVODemo
//
//  Created by Ren Guohua on 14-9-2.
//  Copyright (c) 2014年 Ren Guohua. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configNavigationBar];
    [self initNamelabel];
    [self initAgeLabel];
    [self initChangeButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addObserver];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self removeObserver];
}

- (void)configNavigationBar
{
    self.navigationItem.title = @"KVODemo";
}

- (void)initNamelabel
{
    _nameLabel = [[UILabel alloc] initWithFrame:(CGRect){
        
        .origin.x = 0.0f,
        .origin.y = 84.0f,
        .size.width = 320.0f,
        .size.height = 44.0f,
    }];
    
    _nameLabel.textColor = [UIColor orangeColor];
    _nameLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_nameLabel];
}

- (void)initAgeLabel
{
    _ageLabel = [[UILabel alloc] initWithFrame:(CGRect){
        
        .origin.x = 0.0f,
        .origin.y = CGRectGetMaxY(_nameLabel.frame) + 20.0f,
        .size.width = 320.0f,
        .size.height = 44.0f,
    }];
    
    _ageLabel.textColor = [UIColor orangeColor];
    _ageLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_ageLabel];
}


- (void)initChangeButton
{
    _changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _changeButton.frame = (CGRect){
        
        .origin.x = 20.0f,
        .origin.y = CGRectGetMaxY(_ageLabel.frame) + 40.0f,
        .size.width = 280.0f,
        .size.height = 44.0f,
    };
    
    _changeButton.layer.borderWidth = 2.0f;
    _changeButton.layer.borderColor = [UIColor greenColor].CGColor;
    _changeButton.tintColor =[UIColor greenColor];
    
    [_changeButton setTitle:@"changePerson" forState:UIControlStateNormal];
    
    [_changeButton addTarget:self action:@selector(changePerson:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_changeButton];

}


- (void)changePerson:(id)sender
{
    [[Person sharePerson] changePerson];

}


# pragma - mark  KVO Observer

- (void)addObserver
{
    [[Person sharePerson] addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionInitial context:(__bridge void*)self];
    [[Person sharePerson] addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionInitial context:(__bridge void*)self];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ((__bridge id)context == self)
    {
        if ([keyPath isEqualToString:@"name"])
        {
            self.nameLabel.text = [Person sharePerson].name;
        }
        if ([keyPath isEqualToString:@"age"])
        {
            self.ageLabel.text = [[Person sharePerson].age stringValue];
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)removeObserver
{
    [self removeObserver:self forKeyPath:@"name" context:(__bridge void*)self];
    
    [self removeObserver:self forKeyPath:@"age" context:(__bridge void*)self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end

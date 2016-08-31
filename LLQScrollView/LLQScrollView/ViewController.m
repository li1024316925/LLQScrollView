//
//  ViewController.m
//  LLQScrollView
//
//  Created by DahaiZhang on 16/8/31.
//  Copyright © 2016年 LLQ. All rights reserved.
//

#import "ViewController.h"
#import "LLQScorllView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LLQScorllView *llqview = [[LLQScorllView alloc] initWithFrame:CGRectMake(20, 100, 300, 70) WithArray:@[@"aaaa",@"bbbb",@"cccc",@"dddd"] WithlineNum:2];
    llqview.scorllTime = 4;
    llqview.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:llqview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

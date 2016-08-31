//
//  LLQScorllView.m
//  LLQScrollView
//
//  Created by DahaiZhang on 16/8/31.
//  Copyright © 2016年 LLQ. All rights reserved.
//

#import "LLQScorllView.h"

@implementation LLQScorllView
{
    UITableView *_mianTableView;
    NSTimer *_timer;
}
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)array{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataArray = array;
        
        if (self.lineNum == 0) {
            self.lineNum = 2;
        }
        if (self.scorllTime == 0) {
            self.scorllTime = 1.0;
        }
        
        [self createTableView];
        
    }
    
    return self;
}

//复写lineNum的set方法
- (void)setLineNum:(NSInteger)lineNum{
    
    _lineNum = lineNum;
    
    [_mianTableView reloadData];
    
}

//复写scorllTime的set方法
- (void)setScorllTime:(CGFloat)scorllTime{
    
    _scorllTime = scorllTime;
    [self addTimer];
    
}

//创建表视图
- (void)createTableView{
    
    _mianTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    _mianTableView.rowHeight = _mianTableView.bounds.size.height/_lineNum;
    _mianTableView.delegate = self;
    _mianTableView.dataSource = self;
    
    [self addSubview:_mianTableView];
    
}

//添加计时器
- (void)addTimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.scorllTime target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
}

//计时器方法
- (void)timerAction:(NSTimer *)timer{
    
    [_mianTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    
}


#pragma mark ------ UITableViewDataSource and UITbaleViewDelegate

//返回每组单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _lineNum;
    
}

//返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"llqScorllViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"llqScorllViewCell"];
        cell.textLabel.text = @"标题";
        cell.detailTextLabel.text = @"副标题";
    }
    
    return cell;
}


//销毁时结束定时器
- (void)dealloc{
    
    [_timer invalidate];
    
}

@end

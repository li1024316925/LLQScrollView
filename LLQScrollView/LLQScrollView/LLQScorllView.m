//
//  LLQScorllView.m
//  LLQScrollView
//
//  Created by DahaiZhang on 16/8/31.
//  Copyright © 2016年 LLQ. All rights reserved.
//

#import "LLQScorllView.h"
#import "LLQScorllViewCell.h"

@implementation LLQScorllView
{
    UITableView *_mianTableView;
    NSTimer *_timer;
    NSMutableArray *_onceArray;
    int _index;
}
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)array WithlineNum:(int)lineNum{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataArray = array;
        self.lineNum = lineNum;
        
        if (self.lineNum == 0) {
            self.lineNum = 2;
        }
        if (self.scorllTime == 0) {
            self.scorllTime = 1.0;
        }
        
        [self loadData];
        [self createTableView];
        
    }
    
    return self;
}

//数组懒加载
- (NSMutableArray *)lineArray{
    if (_lineArray == nil) {
        _lineArray = [[NSMutableArray alloc] init];
    }
    return _lineArray;
}

//复写scorllTime的set方法
- (void)setScorllTime:(CGFloat)scorllTime{
    
    _scorllTime = scorllTime;
    
    if (_dataArray.count > 0) {
        [self addTimer];
    }
    
}

//创建表视图
- (void)createTableView{
    
    _mianTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    _mianTableView.rowHeight = _mianTableView.bounds.size.height/_lineNum;
    _mianTableView.delegate = self;
    _mianTableView.dataSource = self;
    _mianTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mianTableView.scrollEnabled = NO;
    
    
    [self addSubview:_mianTableView];
    
}

//加载数据
- (void)loadData{
    
    if (_dataArray.count > 0) {
        for (int i = 0; i < _dataArray.count; i = i+_lineNum) {
            NSArray *array = [NSArray array];
            if ((_dataArray.count - i)<_lineNum) {
                array = [_dataArray subarrayWithRange:NSMakeRange(i, (_dataArray.count - i))];
            }else{
                array = [_dataArray subarrayWithRange:NSMakeRange(i, _lineNum)];
            }
            [self.lineArray addObject:array];
            [self addTimer];
        }
        
        _onceArray = [[NSMutableArray alloc] init];
        _onceArray = [NSMutableArray arrayWithArray:self.lineArray[0]];
    }
    
}

//添加计时器
- (void)addTimer{
    
    [_timer invalidate];
    
    _index = 1;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.scorllTime target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
}

//计时器方法
- (void)timerAction:(NSTimer *)timer{
    
    _onceArray = [[NSMutableArray alloc] init];
    _onceArray = [NSMutableArray arrayWithArray:self.lineArray[_index]];
    
    if (_index == self.lineArray.count - 1) {
        _index = 0;
    }else{
        _index ++;
    }
    
    [_mianTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
    
}


#pragma mark ------ UITableViewDataSource and UITbaleViewDelegate

//返回每组单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _lineNum;
    
}

//返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LLQScorllViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"llqScorllViewCell"];
    if (cell == nil) {
        cell = [[LLQScorllViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"llqScorllViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel2.text = @"副标题";
    }

    NSString *str = [NSString string];
    if (_onceArray.count > indexPath.row) {
        str = _onceArray[indexPath.row];
    }else{
        str = @"";
    }
    
    cell.titleLabel.text = str;
    
    return cell;
}


//销毁时结束定时器
- (void)dealloc{
    
    [_timer invalidate];
    
}

@end

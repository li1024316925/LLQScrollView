//
//  LLQScorllView.h
//  LLQScrollView
//
//  Created by DahaiZhang on 16/8/31.
//  Copyright © 2016年 LLQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLQScorllView : UIView<UITableViewDelegate,UITableViewDataSource>

/**
 每次滚动时间，默认1s
 */
@property (nonatomic, assign)CGFloat scorllTime;

/**
 显示行数，默认为2行
 */
@property (nonatomic, assign)int lineNum;

/**
 数据原数组
 */
@property (nonatomic, strong)NSArray *dataArray;

/**
 每次显示的数据数组
 */
@property (nonatomic, strong)NSMutableArray *lineArray;

/**
 初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)array;

@end

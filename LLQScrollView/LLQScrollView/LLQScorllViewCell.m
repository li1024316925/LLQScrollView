//
//  LLQScorllViewCell.m
//  LLQScrollView
//
//  Created by DahaiZhang on 16/8/31.
//  Copyright © 2016年 LLQ. All rights reserved.
//

#import "LLQScorllViewCell.h"

@implementation LLQScorllViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 40, self.bounds.size.height)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor orangeColor];
        [self addSubview:_titleLabel];
        _titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, self.bounds.size.width - 45, self.bounds.size.height)];
        _titleLabel2.font = [UIFont systemFontOfSize:14];
        _titleLabel2.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel2];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

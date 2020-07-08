//
//  LxmMineJiFenMingXiOneCell.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmMineJiFenMingXiOneCell.h"

@implementation LxmMineJiFenMingXiOneCell

- (void)setModel:(LxmJiFenModel *)model  {
    _model = model;
    
    NSInteger type = model.score_type.integerValue;
    
    
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

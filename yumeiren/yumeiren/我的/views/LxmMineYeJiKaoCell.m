//
//  LxmMineYeJiKaoCell.m
//  yumeiren
//
//  Created by zk on 2020/7/2.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmMineYeJiKaoCell.h"

@implementation LxmMineYeJiKaoCell

- (void)awakeFromNib {
    [super awakeFromNib];
     self.backV.backgroundColor = [UIColor whiteColor];
      self.backV.layer.cornerRadius = 5;
      self.backV.layer.shadowColor = [UIColor blackColor].CGColor;
      self.backV.layer.shadowOffset = CGSizeMake(0, 0);
      self.backV.layer.shadowRadius = 5;
      self.backV.layer.shadowOpacity = 0.08;
      self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

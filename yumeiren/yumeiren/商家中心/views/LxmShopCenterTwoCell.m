//
//  LxmShopCenterTwoCell.m
//  yumeiren
//
//  Created by zk on 2020/6/30.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmShopCenterTwoCell.h"

@implementation LxmShopCenterTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backV.backgroundColor = [UIColor whiteColor];
    self.backV.layer.cornerRadius = 5;
    self.backV.layer.shadowColor = [UIColor blackColor].CGColor;
    self.backV.layer.shadowOffset = CGSizeMake(0, 0);
    self.backV.layer.shadowRadius = 5;
    self.backV.layer.shadowOpacity = 0.08;
    self.contentView.backgroundColor = [UIColor clearColor];
    

    [self.leftBt setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    [self.rightBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.yjView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"yjright"]];
    
    
    
}
- (IBAction)clickAction:(UIButton *)sender {
    if (sender.tag == 100) {
        self.yjView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"yjleft"]];
        [self.leftBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.rightBt setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    }else {
        self.yjView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"yjright"]];
        [self.rightBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.leftBt setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}






@end

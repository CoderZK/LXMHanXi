//
//  LxmHomeOneCell.h
//  yumeiren
//
//  Created by zk on 2020/7/31.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LxmHomeOneCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *desLB;
@property (weak, nonatomic) IBOutlet UILabel *moneyLB;
@property (weak, nonatomic) IBOutlet UIButton *addBt;
@property (weak, nonatomic) IBOutlet UIView *backV;
@property(nonatomic,strong)NSString *desTStr;
@property(nonatomic,strong)LxmHomeGoodsModel *model;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jjj;

@end

NS_ASSUME_NONNULL_END

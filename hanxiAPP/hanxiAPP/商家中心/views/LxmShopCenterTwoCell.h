//
//  LxmShopCenterTwoCell.h
//  yumeiren
//
//  Created by zk on 2020/6/30.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LxmShopCenterTwoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backV;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UIButton *leftBt;
@property (weak, nonatomic) IBOutlet UIButton *rightBt;
@property (weak, nonatomic) IBOutlet UILabel *leftOneLB;
@property (weak, nonatomic) IBOutlet UILabel *leftTwoLB;
@property (weak, nonatomic) IBOutlet UILabel *rightOneLB;
@property (weak, nonatomic) IBOutlet UILabel *rightTwoLB;
@property (weak, nonatomic) IBOutlet UIView *yjView;

@end

NS_ASSUME_NONNULL_END

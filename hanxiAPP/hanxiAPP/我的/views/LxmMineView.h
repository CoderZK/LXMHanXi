//
//  LxmMineView.h
//  yumeiren
//
//  Created by 李晓满 on 2019/7/9.
//  Copyright © 2019 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LxmMineView : UIView

@end

/**
 我的订单
 */
@interface LxmMineOrderCell : UITableViewCell

@property (nonatomic, copy) void(^myOrderBlock)(void);

@property (nonatomic, copy) void(^itemDidSeletAtIndex)(NSInteger index);

@end

/**
 我的cell
 */
@interface LxmMineCell : UITableViewCell

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) LxmUserInfoModel *infoModel;


@property (nonatomic, strong) UIImageView *iconImgView;//图标

@property (nonatomic, strong) UILabel *titleLabel;//标题

@property (nonatomic, strong) UILabel *detaillabel;//详情信息

@property (nonatomic, strong) UIImageView *accImgView;//箭头

@property (nonatomic, strong) UIView *lineView;//线

@end

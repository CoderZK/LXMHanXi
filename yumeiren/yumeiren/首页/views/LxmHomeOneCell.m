//
//  LxmHomeOneCell.m
//  yumeiren
//
//  Created by zk on 2020/7/31.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmHomeOneCell.h"
#import "LxmGoodsDetailVC.h"
#import "LxmShengJiVC.h"
#import "LxmRenZhengProtocolVC.h"
#import "LxmSafeAutherVC.h"
@implementation LxmHomeOneCell




- (void)awakeFromNib {
    [super awakeFromNib];
    self.backV.backgroundColor = [UIColor whiteColor];
    self.backV.layer.cornerRadius = 5;
    self.backV.layer.shadowColor = [UIColor blackColor].CGColor;
    self.backV.layer.shadowOffset = CGSizeMake(0, 0);
    self.backV.layer.shadowRadius = 5;
    self.backV.layer.shadowOpacity = 0.08;
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.addBt.layer.cornerRadius = 12.5;
    self.addBt.clipsToBounds = YES;
    self.moneyLB.textColor = MainColor;
    
}

- (void)setModel:(LxmHomeGoodsModel *)model {
    _model = model;
    
    
[self.imgV sd_setImageWithURL:[NSURL URLWithString:model.list_pic] placeholderImage:[UIImage imageNamed:@"tupian"]];
    self.titleLB.text = model.good_name;
    
    self.moneyLB.text = [NSString stringWithFormat:@"¥%@",model.good_price];
}

- (void)setDesTStr:(NSString *)desTStr {
    _desTStr = desTStr;
    self.desLB.text = desTStr;
}

- (IBAction)addaction:(id)sender {
    
    [self addCarClick:self.model];
    
    
    
}



/**
 添加购物车 如果没有角色 需要先升级 最少是经理才能购买货物
 */
- (void)addCarClick:(LxmHomeGoodsModel *)goodModel {
    if (([LxmTool.ShareTool.userModel.roleType isEqualToString:@"-0.5"] || [LxmTool.ShareTool.userModel.roleType isEqualToString:@"-0.4"] || [LxmTool.ShareTool.userModel.roleType isEqualToString:@"-0.3"] || [LxmTool.ShareTool.userModel.roleType isEqualToString:@"1.1"] || [LxmTool.ShareTool.userModel.roleType isEqualToString:@"2.1"] || [LxmTool.ShareTool.userModel.roleType isEqualToString:@"3.1"]) && goodModel.special_type.intValue != 2) {
        [SVProgressHUD showErrorWithStatus:@"不属于减肥单项商品，无法购买"];
        return;
    }
    
    if ([LxmTool ShareTool].userModel.roleType.intValue == -1) {//没有身份 不能进行购买商品
        if ([LxmTool ShareTool].userModel.shopStatus.intValue == 2 || [LxmTool ShareTool].userModel.shopStatus.intValue == 6 ) {
//            addCarBlock();
            [self addCar:goodModel];
        } else {
            if ([LxmTool ShareTool].userModel.idCode.isValid) {//已实名认证
                if ([LxmTool ShareTool].userModel.thirdStatus.intValue == 1) {//已读
                    LxmShengJiVC *vc = [[LxmShengJiVC alloc] init];
                    vc.hidesBottomBarWhenPushed = YES;
                    [UIViewController.topViewController.navigationController pushViewController:vc animated:YES];
                } else if ([LxmTool ShareTool].userModel.thirdStatus.intValue == 2){
                    //未读 跳转协议界面
                    LxmRenZhengProtocolVC *vc = [[LxmRenZhengProtocolVC alloc] init];
                    vc.hidesBottomBarWhenPushed = YES;
                    [UIViewController.topViewController.navigationController pushViewController:vc animated:YES];
                }
                
            } else {
                LxmSafeAutherVC *vc = [[LxmSafeAutherVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                vc.isnext = YES;
                [UIViewController.topViewController.navigationController pushViewController:vc animated:YES];
            }
        }
    } else {
        [self addCar:goodModel];
    }
}

- (void)addCar:(LxmHomeGoodsModel *)goodModel {
    NSInteger shopStatus = LxmTool.ShareTool.userModel.shopStatus.intValue;
    if (shopStatus == 0 || shopStatus == 1 || shopStatus == 2 || shopStatus == 4 || shopStatus == 5) {//有升级中的状态 不能直接加入购物车 要提示进入升级通道
        UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"进入升级通道,下单更便宜哦!" message:@"是否进入升级通道?" preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
           LxmShengJiVC *vc = [[LxmShengJiVC alloc] init];
           vc.hidesBottomBarWhenPushed = YES;
           [UIViewController.topViewController.navigationController pushViewController:vc animated:YES];
        }]];
        [UIViewController.topViewController presentViewController:alertView animated:YES completion:nil];
        
    } else {
        NSMutableDictionary *dict = @{
                                  @"token" : SESSION_TOKEN,
                                  @"goodId" : goodModel.id,
                                  @"num" : @1
        }.mutableCopy;
        if ((LxmTool.ShareTool.userModel.roleType.intValue == 2 || LxmTool.ShareTool.userModel.roleType.intValue == 3)) {
            dict[@"num"] = goodModel.buy_num;
        }
           [SVProgressHUD show];
           [LxmNetworking networkingPOST:add_cart parameters:dict returnClass:nil success:^(NSURLSessionDataTask *task, id responseObject) {
               [SVProgressHUD dismiss];
               if ([responseObject[@"key"] integerValue] == 1000) {
                   [SVProgressHUD showSuccessWithStatus:@"添加成功!"];
                   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                       [LxmEventBus sendEvent:@"addCarSuccess" data:nil];
                   });
                   
               } else {
                   [UIAlertController showAlertWithmessage:responseObject[@"message"]];
               }
           } failure:^(NSURLSessionDataTask *task, NSError *error) {
               [SVProgressHUD dismiss];
           }];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

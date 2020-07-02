//
//  LxmMineJiFenXiaJiTVC.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmMineJiFenXiaJiTVC.h"
#import "LxmMineJifenMingXiTVC.h"
#import "LxmJiFenDeatilOneTVC.h"
#import "LxmZhuanChuJiFenVC.h"
#import "LxmMineYeJiKaoTVC.h"
#import "LxmMineTeamJiFenMingXiTVC.h"
@interface LxmMineJiFenXiaJiTVC ()
@property(nonatomic,strong)UIButton *leftButton,*rightButton;
@property(nonatomic,strong)UIView *navTitleV;
@property(nonatomic,strong)UIView *headViewOne,*headViewTwo;
@property(nonatomic,strong)UILabel *numberLB,*LB1,*LB2,*LB3,*LB4,*JifenLB;
@property(nonatomic,strong)UIButton  *tixianBt,*mineJiFenBt,*shengYujiFenBt;
@property(nonatomic,strong)UIImageView *imgV1,*imgV2;
@property(nonatomic,strong)UIView  *redV;
@property(nonatomic,strong)UIView *btView;


@end

@implementation LxmMineJiFenXiaJiTVC

-(UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
        [_leftButton setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [_leftButton setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateSelected];
        [_leftButton setTitle:@"我的积分" forState:UIControlStateNormal];
        _leftButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.selected = YES;
        _leftButton.tag = 443;
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
        [_rightButton setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [_rightButton setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateSelected];
        [_rightButton setTitle:@"直属推荐积分" forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _rightButton.tag = 444;
    }
    return _rightButton;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavTitleV];
    [self addHeadViewOne];
    [self addheadViewTwo];
    
}

- (void)addHeadViewOne {
    
    self.headViewOne = [[UIView alloc] init];
    self.headViewOne.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.headViewOne];
    
    
//    UIView * backV =[[UIView alloc] init];
//    backV.backgroundColor = CharacterLightGrayColor;
//    [self.headViewOne addSubview:backV];
    

    
    UILabel * numberLb = [[UILabel alloc] init];
    numberLb.text = @"同级别业绩排名:55";
    numberLb.font = [UIFont systemFontOfSize:14];
    numberLb.textColor = CharacterDarkColor;
    [self.headViewOne addSubview:numberLb];
    
    
    
    UIImageView * imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"kkjifenback"];
    imageV.userInteractionEnabled = YES;
    [self.headViewOne addSubview:imageV];
    
    
    UILabel * jiFenLB  = [[UILabel alloc] init];
    jiFenLB.font = [UIFont systemFontOfSize:20 weight:0.2];
    jiFenLB.text = @"2000";
    jiFenLB.textAlignment = NSTextAlignmentCenter;
    jiFenLB.textColor = [UIColor whiteColor];
    [imageV  addSubview:jiFenLB];
    
    
    
    UIButton  * mingXiBt = [[UIButton alloc] init];
    mingXiBt.layer.borderColor = RGB(236, 104, 118).CGColor;
    [mingXiBt setTitle:@"我的积分 >" forState:UIControlStateNormal];
    [mingXiBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    mingXiBt.titleLabel.font = [UIFont systemFontOfSize:13];
    mingXiBt.tag = 100;
    [mingXiBt addTarget:self action:@selector(jifenAction:) forControlEvents:UIControlEventTouchUpInside];
    [imageV addSubview:mingXiBt];
    
    
    UILabel * jiFenLBTwo  = [[UILabel alloc] init];
    jiFenLBTwo.font = [UIFont systemFontOfSize:20 weight:0.2];
    jiFenLBTwo.text = @"2000";
    jiFenLBTwo.textAlignment = NSTextAlignmentCenter;
    jiFenLBTwo.textColor = [UIColor whiteColor];
    [imageV  addSubview:jiFenLBTwo];
    
    
    
    UIButton  * mingXiBtTwo = [[UIButton alloc] init];
    mingXiBtTwo.layer.borderColor = RGB(236, 104, 118).CGColor;
    [mingXiBtTwo setTitle:@"剩余待转积分 >" forState:UIControlStateNormal];
    [mingXiBtTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    mingXiBtTwo.titleLabel.font = [UIFont systemFontOfSize:13];
    mingXiBtTwo.tag = 101;
    [imageV addSubview:mingXiBtTwo];
    [mingXiBtTwo addTarget:self action:@selector(jifenAction:) forControlEvents:UIControlEventTouchUpInside];
    UIView * lineV = [[UIView alloc] init];
    lineV.backgroundColor = [UIColor whiteColor];
    [imageV addSubview:lineV];
    
    
    
    UIButton * tixianBt  =[[UIButton alloc] init];
    [tixianBt setTitle:@"转出积分" forState:UIControlStateNormal];
    [tixianBt setTitleColor:RGB(236, 104, 118) forState:UIControlStateNormal];
    tixianBt.titleLabel.font = [UIFont systemFontOfSize:15];
    [tixianBt setBackgroundImage:[UIImage imageNamed:@"white"] forState:UIControlStateNormal];
    [imageV addSubview:tixianBt];
    tixianBt.layer.cornerRadius = 5;
    tixianBt.tag = 102;
    [tixianBt addTarget:self action:@selector(jifenAction:) forControlEvents:UIControlEventTouchUpInside];
    tixianBt.clipsToBounds = YES;
    
    self.btView = [[UIView alloc] init];
    self.btView.backgroundColor = [UIColor whiteColor];
    [self.headViewOne addSubview:self.btView];
    
    UIView * backVTwo =[[UIView alloc] init];
    backVTwo.backgroundColor = CharacterLightGrayColor;
    [self.btView addSubview:backVTwo];
    
    UIButton  * leftBt = [[UIButton alloc] init];
    [leftBt setTitle:@"同级直属" forState:UIControlStateNormal];
    [leftBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBt.titleLabel.font = [UIFont systemFontOfSize:14];
    [leftBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    leftBt.tag = 100;
    [self.btView addSubview:leftBt];
    
    
    UIButton  * rightBt = [[UIButton alloc] init];
    [rightBt setTitle:@"同级非直属" forState:UIControlStateNormal];
    [rightBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBt.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    rightBt.tag = 101;
    [self.btView addSubview:rightBt];
    
    self.redV = [[UIView alloc] init];
    self.redV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"deepPink"]];
    [self.btView addSubview:self.redV];
    
    [self.headViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        //        make.height.equalTo(@270);
    }];

    
    [numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headViewOne).offset(15);
        make.top.equalTo(self.headViewOne).offset(5);
        make.height.equalTo(@20);
    }];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@200);
        make.width.equalTo(@(ScreenW - 10));
        make.centerX.equalTo(self.headViewOne);
        make.top.equalTo(numberLb.mas_bottom).offset(7);
    }];
    
    if (0) {
        lineV.hidden = YES;
        [jiFenLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(imageV);
            make.top.equalTo(imageV).offset(35);
            make.height.equalTo(@25);
        }];
        [mingXiBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(imageV);
            make.height.equalTo(@20);
            make.top.equalTo(jiFenLB.mas_bottom).offset(12);
        }];
        [tixianBt setTitle:@"转出积分" forState:UIControlStateNormal];
    }else {
        lineV.hidden = NO;
        [jiFenLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageV).offset(15);
            make.width.equalTo(@((ScreenW - 31)/ 2));
            make.top.equalTo(imageV).offset(35);
            make.height.equalTo(@25);
        }];
        [mingXiBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageV);
            make.width.equalTo(jiFenLB.mas_width);
            make.height.equalTo(@20);
            make.top.equalTo(jiFenLB.mas_bottom).offset(12);
        }];
        
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@50);
            make.top.equalTo(imageV).offset(40);
            make.width.equalTo(@1);
            make.left.equalTo(jiFenLB.mas_right);
        }];
        
        [jiFenLBTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineV);
            make.top.equalTo(imageV).offset(35);
            make.width.equalTo(@((ScreenW - 31)/ 2));
            make.height.equalTo(@25);
        }];
        [mingXiBtTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(jiFenLBTwo.mas_left);
            make.width.equalTo(jiFenLBTwo.mas_width);
            make.height.equalTo(@20);
            make.top.equalTo(jiFenLB.mas_bottom).offset(12);
        }];
        [tixianBt setTitle:@"提现" forState:UIControlStateNormal];
    }
    
    
    
    [tixianBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imageV);
        make.width.equalTo(@180);
        make.height.equalTo(@40);
        make.bottom.equalTo(imageV).offset(-44);
    }];
    
    [self.btView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.headViewOne);
        make.top.equalTo(imageV.mas_bottom);
        make.bottom.equalTo(self.headViewOne);
        make.height.equalTo(@50);
    }];
    
    [leftBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenW /2));
        make.height.equalTo(@40);
        make.left.equalTo(self.btView);
        make.centerY.equalTo(self.btView);
    }];

    [rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(ScreenW /2));
        make.height.equalTo(@40);
        make.left.equalTo(leftBt.mas_right);
        make.centerY.equalTo(self.btView);
    }];
    
    [self.redV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@3);
        make.top.equalTo(self.btView).offset(40);
        make.centerX.equalTo(leftBt);
    }];
    
    [backVTwo mas_makeConstraints:^(MASConstraintMaker *make) {
           make.height.equalTo(@(0.2));
           make.bottom.right.left.equalTo(self.btView);
       }];
    
    
}



- (void)addheadViewTwo {
    
    if (self.headViewTwo != nil) {
        return;
    }
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"kkzhixi"]];
    
    self.headViewTwo = [[UIView alloc] init];
    self.headViewTwo.backgroundColor  = [UIColor whiteColor];
    self.headViewTwo.hidden = YES;
    //    [self.headViewTwo.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.view addSubview:self.headViewTwo];
    
    [self.headViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).offset(-40);
        make.width.equalTo(@(ScreenW - 60));
        make.height.equalTo(@320);
    }];
    self.headViewTwo.layer.cornerRadius = 5;
    self.headViewTwo.clipsToBounds = YES;
    
    
    UIButton  * mingXiBt = [[UIButton alloc] init];
    mingXiBt.layer.cornerRadius = 12;
    mingXiBt.clipsToBounds = YES;
    mingXiBt.layer.borderWidth = 0.5;
    mingXiBt.layer.borderColor = RGB(236, 104, 118).CGColor;
    [mingXiBt setTitle:@"明细 >   " forState:UIControlStateNormal];
    [mingXiBt setTitleColor:RGB(236, 104, 118) forState:UIControlStateNormal];
    mingXiBt.titleLabel.font = [UIFont systemFontOfSize:12];
    mingXiBt.tag = 103;
    [mingXiBt addTarget:self action:@selector(jifenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.headViewTwo addSubview:mingXiBt];
    
    [mingXiBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headViewTwo.mas_right).offset(13);
        make.height.equalTo(@24);
        make.width.equalTo(@72);
        make.top.equalTo(self.headViewTwo.mas_top).offset(12);
    }];
    
    
    UIImageView * imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"kk629"];
    [self.headViewTwo addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headViewTwo.mas_centerX);
        make.width.height.equalTo(@39);
        make.top.equalTo(self.headViewTwo.mas_top).offset(53);
    }];
    
    UILabel * tuiJianJifen  = [[UILabel alloc] init];
    tuiJianJifen.font = [UIFont systemFontOfSize:15];
    tuiJianJifen.text = @"直属推荐积分";
    tuiJianJifen.textAlignment = NSTextAlignmentCenter;
    [self.headViewTwo  addSubview:tuiJianJifen];
    
    [tuiJianJifen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.headViewTwo);
        make.top.equalTo(imageV.mas_bottom).offset(20);
        make.height.equalTo(@20);
    }];
    
    
    UILabel * jiFenLB  = [[UILabel alloc] init];
    jiFenLB.font = [UIFont systemFontOfSize:20 weight:0.2];
    jiFenLB.text = @"2000";
    jiFenLB.textAlignment = NSTextAlignmentCenter;
    jiFenLB.textColor = RGB(236, 104, 118);
    [self.headViewTwo  addSubview:jiFenLB];
    
    [jiFenLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.headViewTwo);
        make.top.equalTo(tuiJianJifen.mas_bottom).offset(15);
        make.height.equalTo(@25);
    }];
    self.JifenLB = jiFenLB;
    
    UIButton * tixianBt  =[[UIButton alloc] init];
    [tixianBt setTitle:@"申请提现" forState:UIControlStateNormal];
    [tixianBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tixianBt.titleLabel.font = [UIFont systemFontOfSize:15];
    [tixianBt setBackgroundImage:[UIImage imageNamed:@"deepPink"] forState:UIControlStateNormal];
    [self.headViewTwo addSubview:tixianBt];
    tixianBt.tag = 104;
    [tixianBt addTarget:self action:@selector(jifenAction:) forControlEvents:UIControlEventTouchUpInside];
    [tixianBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headViewTwo.mas_centerX);
        make.width.equalTo(@180);
        make.height.equalTo(@40);
        make.bottom.equalTo(self.headViewTwo.mas_bottom).offset(-50);
    }];
    tixianBt.layer.cornerRadius = 5;
    tixianBt.clipsToBounds = YES;
    
    
}




- (void)addNavTitleV {
    
    self.navTitleV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.navTitleV.layer.cornerRadius = 15;
    self.navTitleV.clipsToBounds  = YES;
    self.navTitleV.layer.borderColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pink"]].CGColor;
    self.navTitleV.layer.borderWidth = 0.5;
    [self.navTitleV addSubview:self.leftButton];
    self.leftButton.frame = CGRectMake(0, 0, 100, 30);
    [self.navTitleV addSubview:self.rightButton];
    self.rightButton.frame = CGRectMake(100, 0, 100, 30);
    
    self.navigationItem.titleView = self.navTitleV;
}


- (void)buttonClick:(UIButton *)button {
    
    if (button.tag == 443) {
        self.leftButton.selected = YES;
        self.rightButton.selected = NO;
        self.headViewTwo.hidden = YES;
        self.headViewOne.hidden = NO;
    }else {
        self.leftButton.selected = NO;
        self.rightButton.selected = YES;
        self.headViewTwo.hidden = NO;
        self.headViewOne.hidden = YES;
    }
    
}

- (void)clickAction:(UIButton *)button {
   
    if (button.tag == 100) {
        [UIView animateWithDuration:0.2 animations:^{
              self.redV.mj_x = ScreenW  / 4 - 20;
          }];
    }else {
        [UIView animateWithDuration:0.2 animations:^{
              self.redV.mj_x = ScreenW * 3 / 4 - 20;
          }];
    }
    
  

}

// 100 我的积分 101 剩余待转积分 102 提现(或者转出积分) 103 明细 104 申请提现
- (void)jifenAction:(UIButton *)button {
    if (button.tag == 100) {
        
        LxmMineJifenMingXiTVC * vc =[[LxmMineJifenMingXiTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (button.tag == 101) {
        LxmMineYeJiKaoTVC * vc =[[LxmMineYeJiKaoTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];

    }else if (button.tag == 102) {
        if ([button.titleLabel.text isEqualToString:@"转出积分"]) {
            LxmZhuanChuJiFenVC * vc =[[LxmZhuanChuJiFenVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }else {
           //提现
            LxmMineTeamJiFenMingXiTVC * vc =[[LxmMineTeamJiFenMingXiTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    }else if (button.tag == 103) {
        
        LxmMineJifenMingXiTVC * vc =[[LxmMineJifenMingXiTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else if (button.tag == 104) {
        LxmZhuanChuJiFenVC * vc =[[LxmZhuanChuJiFenVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
}

@end

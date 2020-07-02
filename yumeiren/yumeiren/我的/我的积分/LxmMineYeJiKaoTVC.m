//
//  LxmMineYeJiKaoTVC.m
//  yumeiren
//
//  Created by zk on 2020/7/2.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmMineYeJiKaoTVC.h"
#import "LxmMineYeJiKaoCell.h"
#import "LxmYeJiKaoHeView.h"
@interface LxmMineYeJiKaoTVC ()
@property(nonatomic,strong)UIView *yjView;
@property(nonatomic,strong)UIButton *leftBt,*rightBt;
@property(nonatomic,assign)NSInteger type,year,month;
@property(nonatomic,strong)UILabel *titelLB;
@end

@implementation LxmMineYeJiKaoTVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"业绩考核";
    [self.tableView registerNib:[UINib nibWithNibName:@"LxmMineYeJiKaoCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.type = 1;
    [self addHeadV];
    
}

- (void)addHeadV {
    
    UIView * headV  =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 50)];
    headV.backgroundColor = [UIColor whiteColor];
    UILabel * LB1  =[[UILabel alloc] init];
    LB1.text = @"当前为";
    LB1.font = [UIFont systemFontOfSize:14];
    [headV addSubview:LB1];
    
    UILabel * LB2  =[[UILabel alloc] init];
    LB2.font = [UIFont systemFontOfSize:14];
    [headV addSubview:LB2];
    LB2.text = @"2020年第二季度(4-6月)";
    self.titelLB = LB2;
    LB2.textColor = RGB(236, 104, 118);
    
    UIImageView * imageV  =[[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"kkxia"];
    [headV addSubview:imageV];
    
    self.yjView = [[UIView alloc] init];
    self.yjView.layer.cornerRadius = 10;
    self.yjView.clipsToBounds = YES;
    [headV addSubview:self.yjView];
    
    self.leftBt = [[UIButton alloc] init];
    self.leftBt.tag = 100;
    [self.leftBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.leftBt.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.leftBt setTitle:@"月" forState:UIControlStateNormal];
    [self.yjView addSubview:self.leftBt];
    
    self.rightBt = [[UIButton alloc] init];
    self.rightBt.tag = 101;
    [self.rightBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBt.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.rightBt setTitle:@"季" forState:UIControlStateNormal];
    [self.yjView addSubview:self.rightBt];
    
    
    
    [self.leftBt setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    [self.rightBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.yjView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"yjright"]];
    
    
    UIButton * bt = [[UIButton alloc] init];
    bt.tag = 102;
    [bt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [headV addSubview:bt];
    
    [LB1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headV).offset(15);
        make.centerY.equalTo(headV);
        make.height.equalTo(@20);
    }];
    
    [LB2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(LB1.mas_right);
        make.centerY.equalTo(headV);
        make.height.equalTo(@20);
    }];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(LB2.mas_right).offset(5);
        make.centerY.equalTo(headV);
        make.height.width.equalTo(@12);
    }];
    
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headV);
        make.height.equalTo(@40);
        make.left.equalTo(LB1.mas_left);
        make.right.equalTo(imageV.mas_right);
    }];
    
    [self.yjView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headV).offset(-15);
        make.width.equalTo(@50);
        make.height.equalTo(@20);
        make.centerY.equalTo(headV);
    }];
    
    [self.leftBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.yjView);
        make.width.equalTo(@25);
    }];
    [self.rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self.yjView);
        make.width.equalTo(@25);
    }];
    
    
    self.tableView.tableHeaderView = headV;
}

- (void)clickAction:(UIButton *)sender {
    if (sender.tag == 100) {
        self.type = sender.tag - 100;
        self.yjView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"yjleft"]];
        [self.leftBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.rightBt setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    }else if (sender.tag == 101){
        self.type = sender.tag - 100;
        self.yjView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"yjright"]];
        [self.rightBt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.leftBt setTitleColor:CharacterGrayColor forState:UIControlStateNormal];
    }else if (sender.tag  == 102) {
        //点击选择时间
        
        LxmYeJiKaoHeView * view  =[[LxmYeJiKaoHeView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) withType:self.type];
//        view.type = self.type;
        WeakObj(self);
        view.confirmBlock = ^(NSInteger year, NSInteger month, NSString * _Nonnull titleStr) {
            selfWeak.year = year;
            selfWeak.month = month;
            selfWeak.titelLB.text = titleStr;
        };
        [view show];
        
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LxmMineYeJiKaoCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
@end

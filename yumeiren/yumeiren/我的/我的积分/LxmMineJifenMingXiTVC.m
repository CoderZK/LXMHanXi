//
//  LxmMineJifenMingXiTVC.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmMineJifenMingXiTVC.h"
#import "LxmMineJiFenMingXiOneCell.h"
@interface LxmMineJifenMingXiTVC ()
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UILabel *timeLB;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIButton *headBt;
@end

@implementation LxmMineJifenMingXiTVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的小晞明细";
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 45)];
    self.headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableHeaderView = self.headView;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LxmMineJiFenMingXiOneCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setHeadSubViews];
    
    
}

- (void)setHeadSubViews {
    
    self.timeLB = [[UILabel alloc] init];
    self.timeLB.font = [UIFont systemFontOfSize:13];
    self.timeLB.text = @"2019年6月";
    [self.headView addSubview:self.timeLB];
    
    [self.timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headView.mas_left).offset(15);
        make.centerY.equalTo(self.headView.mas_centerY);
        make.height.equalTo(@20);
    }];
    
    self.imgV =[[UIImageView alloc] init];
    self.imgV.image = [UIImage imageNamed:@"kkback"];
    [self.headView addSubview:self.imgV];
    
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLB.mas_right).offset(3);
        make.centerY.equalTo(self.headView.mas_centerY);
        make.height.equalTo(@6);
        make.width.equalTo(@(10.5));
    }];
 
    self.headBt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenW / 2, 45)];
    [self.headBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:self.headBt];
    
    
    
}

//点击月份
- (void)clickAction:(UIButton *)button {
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LxmMineJiFenMingXiOneCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end

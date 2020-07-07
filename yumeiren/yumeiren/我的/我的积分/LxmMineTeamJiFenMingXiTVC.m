//
//  LxmMineTeamJiFenMingXiTVC.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmMineTeamJiFenMingXiTVC.h"

@interface LxmMineTeamJiFenMingXiTVC ()

@end

@implementation LxmMineTeamJiFenMingXiTVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self setNave];
    
    
    
}

- (void)setNave {
    
    UIImageView * imageV  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, StateBarH + 44 + 120)];
    [self.view addSubview:imageV];
    imageV.image = [UIImage imageNamed:@"bg_jianbian11"];
    imageV.backgroundColor = [UIColor redColor];
    [self.view bringSubviewToFront:self.tableView];
    
    
    UILabel * lb  = [[UILabel alloc] initWithFrame:CGRectMake(50, StateBarH, ScreenW - 100, 44)];
    lb.text = @"团队小晞明细";
    lb.textAlignment = NSTextAlignmentCenter;
    lb.font = [UIFont systemFontOfSize:18];
    lb.textColor = [UIColor whiteColor];
    [self.view addSubview:lb];
    
    UIButton * backBt  = [[UIButton alloc] initWithFrame:CGRectMake(10, StateBarH + 7, 30, 30)];
    [backBt setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    [self.view addSubview:backBt];
    
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end

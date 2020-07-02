//
//  LxmJiFenDeatilOneTVC.m
//  yumeiren
//
//  Created by zk on 2020/7/2.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmJiFenDeatilOneTVC.h"
#import "LxmJiFenDetailOneCell.h"
@interface LxmJiFenDeatilOneTVC ()
@property(nonatomic,strong)UILabel *typeLB,*moneyLB;
@end

@implementation LxmJiFenDeatilOneTVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"明细详情";
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LxmJiFenDetailOneCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self addHeadV];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LxmJiFenDetailOneCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)addHeadV  {
    
    UIView * headV  =[[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 180)];
    headV.backgroundColor  = [UIColor whiteColor];
    
    self.typeLB  = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, ScreenW, 20)];
    self.typeLB.textAlignment = NSTextAlignmentCenter;
    self.typeLB.font = [UIFont systemFontOfSize:14];
    self.typeLB.textColor = CharacterDarkColor;
    self.typeLB.text = @"提现";
    [headV addSubview:self.typeLB];
    
    self.moneyLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, ScreenW, 30)];
    self.moneyLB.textAlignment = NSTextAlignmentCenter;
    self.moneyLB.font = [UIFont systemFontOfSize:16 weight:0.2];
    self.moneyLB.textColor = CharacterDarkColor;
    self.moneyLB.text = @"+30000";
    [headV addSubview:self.moneyLB];
    self.tableView.tableHeaderView = headV;
    UIView * backV =[[UIView alloc] initWithFrame:CGRectMake(0, 179.5, ScreenW, 0.5)];
    backV.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [headV addSubview:backV];
    

    
    
}



@end

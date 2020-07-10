//
//  LxmMineJifenMingXiTVC.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmMineJifenMingXiTVC.h"
#import "LxmMineJiFenMingXiOneCell.h"
#import "LxmYeJiKaoHeView.h"
#import "LxmJiFenDeatilOneTVC.h"
@interface LxmMineJifenMingXiTVC ()
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UILabel *timeLB;
@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UIButton *headBt;
@property(nonatomic,assign)NSInteger type,year,month;
@property(nonatomic,strong)NSString *montyStr;
@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSMutableArray <LxmJiFenModel *>*dataArr;
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
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM"];
    self.montyStr = [dateFormatter stringFromDate:[NSDate date]];
    self.dataArr = [NSMutableArray array];
    self.page = 1;
    [self loadData];
    WeakObj(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        StrongObj(self);
        self.page = 1;
        [self loadData];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        StrongObj(self);
        [self loadData];
    }];
    
    
    
}

- (void)setHeadSubViews {
    
    self.timeLB = [[UILabel alloc] init];
    self.timeLB.font = [UIFont systemFontOfSize:13];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM"];
    self.montyStr = [dateFormatter stringFromDate:[NSDate date]];
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    self.timeLB.text = [dateFormatter stringFromDate:[NSDate date]];
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
    LxmYeJiKaoHeView * view  =[[LxmYeJiKaoHeView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH) withType:0];
    //        view.type = self.type;
    WeakObj(self);
    view.confirmBlock = ^(NSInteger year, NSInteger month, NSString * _Nonnull titleStr) {
        selfWeak.year = year;
        selfWeak.month = month;
        selfWeak.montyStr  = [NSString stringWithFormat:@"%ld-%02ld",year,(long)month+1];
        selfWeak.timeLB.text = titleStr;
        
        selfWeak.page = 1;
        [selfWeak loadData];
    };
    [view show];
}

- (void)loadData {
    
    
    [SVProgressHUD show];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"token"] = SESSION_TOKEN;
    dict[@"pageNum"] =  @(self.page);
    dict[@"pageSize"] = @10;
    dict[@"scoreType"] = @(self.scoreType);
    dict[@"month"] = self.montyStr;
    [LxmNetworking networkingPOST:score_record_list parameters:dict returnClass:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [self endRefrish];
        if ([responseObject[@"key"] intValue] == 1000) {
            if (self.page == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:[LxmJiFenModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"][@"list"]]];
            self.page ++;
            [self.tableView reloadData];
        } else {
            [UIAlertController showAlertWithmessage:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self endRefrish];
    }];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LxmMineJiFenMingXiOneCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.dataArr[indexPath.row];
    if([cell.typeBt.titleLabel.text isEqualToString:@"确定"]) {
        cell.typeBt.userInteractionEnabled = YES;
    }else {
         cell.typeBt.userInteractionEnabled = NO;
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    LxmJiFenDeatilOneTVC * vc =[[LxmJiFenDeatilOneTVC alloc] initWithTableViewStyle:(UITableViewStyleGrouped)];
    vc.hidesBottomBarWhenPushed = YES;
    vc.ID = self.dataArr[indexPath.row].ID;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end

//
//  LxmChongZhiVC.m
//  yumeiren
//
//  Created by 李晓满 on 2019/7/25.
//  Copyright © 2019 李晓满. All rights reserved.
//

#import "LxmChongZhiVC.h"
#import "LxmPayVC.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApiRequestHandler.h"
#import "WXApiManager.h"
#import "WechatAuthSDK.h"
#import "LxmChongZhiPiceCell.h"

@interface LxmChongZhiHeaderView : UIView

@property (nonatomic, strong) UILabel *textLabel;//充值金额

@property (nonatomic, strong) UILabel *yuanlabel;//元

@property (nonatomic, strong) UITextField *moneyTF;//输入的钱数

@property (nonatomic, strong) UIView *lineView;//线

@property (nonatomic, strong) UILabel *textLabel11;//单笔充值不能超过50000

@property (nonatomic, strong) UILabel *textLabel1;//选择充值方式





@end
@implementation LxmChongZhiHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
        [self setConstrains];
    }
    return self;
}

/**
 添加视图
 */
- (void)initSubViews {
    [self addSubview:self.textLabel11];
    [self addSubview:self.yuanlabel];
    [self addSubview:self.moneyTF];
    [self addSubview:self.lineView];
    [self addSubview:self.textLabel];
    [self addSubview:self.textLabel1];
}

/**
 添加约束
 */
- (void)setConstrains {
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.leading.equalTo(self).offset(15);
    }];
    [self.yuanlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textLabel.mas_bottom).offset(20);
        make.leading.equalTo(self).offset(15);
        make.width.height.equalTo(@20);
    }];
    [self.moneyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.yuanlabel.mas_trailing);
        make.centerY.equalTo(self.yuanlabel);
        make.trailing.equalTo(self).offset(-15);
        make.height.equalTo(@50);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(15);
        make.trailing.equalTo(self).offset(-15);
        make.top.equalTo(self.moneyTF.mas_bottom);
        make.height.equalTo(@1);
    }];
    [self.textLabel11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(10);
        make.leading.equalTo(self).offset(15);
    }];
    [self.textLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textLabel11.mas_bottom).offset(30);
        make.leading.equalTo(self).offset(15);
    }];
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.font = [UIFont boldSystemFontOfSize:14];
        _textLabel.textColor = CharacterDarkColor;
        _textLabel.text = @"充值金额";
    }
    return _textLabel;
}

- (UILabel *)yuanlabel {
    if (!_yuanlabel) {
        _yuanlabel = [UILabel new];
        _yuanlabel.font = [UIFont boldSystemFontOfSize:25];
        _yuanlabel.textColor = UIColor.blackColor;
        _yuanlabel.text = @"¥";
    }
    return _yuanlabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = BGGrayColor;
    }
    return _lineView;
}

- (UITextField *)moneyTF {
    if (!_moneyTF) {
        _moneyTF = [UITextField new];
        _moneyTF.textColor = UIColor.blackColor;
        _moneyTF.font = [UIFont boldSystemFontOfSize:25];
        _moneyTF.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return _moneyTF;
}

- (UILabel *)textLabel11 {
    if (!_textLabel11) {
        _textLabel11 = [UILabel new];
        _textLabel11.font = [UIFont systemFontOfSize:14];
        _textLabel11.textColor = CharacterLightGrayColor;
        _textLabel11.text = @"单笔充值不能超过¥50000";
    }
    return _textLabel11;
}

- (UILabel *)textLabel1 {
    if (!_textLabel1) {
        _textLabel1 = [UILabel new];
        _textLabel1.font = [UIFont boldSystemFontOfSize:14];
        _textLabel1.textColor = CharacterDarkColor;
        _textLabel1.text = @"选择充值方式";
    }
    return _textLabel1;
}

@end


@interface LxmChongZhiVC ()

@property (nonatomic, strong) UIView *lineView;//

@property (nonatomic, strong) LxmChongZhiHeaderView *headerView;

@property (nonatomic, strong) UIButton *chongzhiButton;//充值

@property (nonatomic, assign) NSInteger currentIndex;

@property(nonatomic,strong)NSMutableArray *picArr;
@property(nonatomic,strong)NSMutableArray *imgs;

@end

@implementation LxmChongZhiVC

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = BGGrayColor;
    }
    return _lineView;
}

- (LxmChongZhiHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[LxmChongZhiHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 170)];
    }
    return _headerView;
}

- (UIButton *)chongzhiButton {
    if (!_chongzhiButton) {
        _chongzhiButton = [[UIButton alloc] init];
        [_chongzhiButton setTitle:@"充值" forState:UIControlStateNormal];
        [_chongzhiButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_chongzhiButton setBackgroundImage:[UIImage imageNamed:@"deepPink"] forState:UIControlStateNormal];
        _chongzhiButton.layer.cornerRadius = 5;
        _chongzhiButton.layer.masksToBounds = YES;
        _chongzhiButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_chongzhiButton addTarget:self action:@selector(chongzhiButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chongzhiButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zhiFuBaoNoti:) name:@"ZhiFuBaoPay" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatPayNoti:) name:@"WXPAY" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"充值";
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self initSubviews];
    self.picArr = @[].mutableCopy;
    self.imgs = @[].mutableCopy;
    [self.tableView registerClass:[LxmChongZhiPiceCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
/**
 初始化子视图
 */
- (void)initSubviews {
    [self.view addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.leading.bottom.trailing.equalTo(self.view);
    }];
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 60)];
    self.tableView.tableFooterView = footView;
    
    [footView addSubview:self.chongzhiButton];
    [self.chongzhiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(footView).offset(-20);
        make.leading.equalTo(footView).offset(20);
        make.bottom.equalTo(footView);
        make.height.equalTo(@44);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if  (indexPath.row == 2) {
        LxmChongZhiPiceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
           cell.dataArray = self.picArr;
           WeakObj(self);
           cell.choosePhotoBlock = ^{
               
               [selfWeak modify];
               
               
           };
        cell.titleStr = @"账户: 1234569872522451;账户名称: 张小飞";
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
           return cell;
           
    }else {
        LxmPayCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LxmPayCell"];
        if (!cell) {
            cell = [[LxmPayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmPayCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.selectImgView.image = self.currentIndex == indexPath.row ? [UIImage imageNamed:@"xuanzhong_y"] : [UIImage imageNamed:@"xuanzhong_n"];
        if (indexPath.row == 0) {
            cell.iconImgView.image = [UIImage imageNamed:@"alipay_pay"];
            cell.titleLabel.text = @"支付宝";
        } else {
            cell.iconImgView.image = [UIImage imageNamed:@"yinhangka"];
            cell.titleLabel.text = @"银行卡";
        }
        return cell;
    }
    
   
    
    

}


- (void)modify {
    UIAlertController * actionController = [UIAlertController alertControllerWithTitle:nil message:@"选择图片上传方式" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * a1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showMXPhotoCameraAndNeedToEdit:YES completion:^(UIImage *image, UIImage *originImage, CGRect cutRect) {
            if (image) {
                [self.picArr addObject:image];
                [self.tableView reloadData];
            }else {
                [SVProgressHUD showErrorWithStatus:@"相片获取失败"];
            }
        }];
    }];
    
    UIAlertAction * a2 = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self showMXPickerWithMaximumPhotosAllow:9-self.picArr.count completion:^(NSArray *assets) {
            
            for (int i = 0 ; i < assets.count; i++) {
                
                
                ALAsset *asset = assets[i];
                                       //全屏分辨率图片
                UIImage *image = [UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
                [self.picArr addObject:image];
                
            }
            [self.tableView reloadData];
        }];
        
//        [self showMXPhotoPickerControllerAndNeedToEdit:YES completion:^(UIImage *image, UIImage *originImage, CGRect cutRect) {
//            if (image) {
//
//            }else {
//                [SVProgressHUD showErrorWithStatus:@"相片获取失败"];
//            }
//        }];
    }];
    UIAlertAction * a3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [actionController addAction:a1];
    [actionController addAction:a2];
    [actionController addAction:a3];
    [self presentViewController:actionController animated:YES completion:nil];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        return (ScreenW - 60)/3 + 25 + 50;
    }else {
        return 60;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if  (indexPath.row != 2) {
        self.currentIndex = indexPath.row;
        [self.tableView reloadData];
    }

}

/**
 充值
 */
- (void)chongzhiButtonClick {
    [self.headerView endEditing:YES];
    if (!self.headerView.moneyTF.text.isValid || self.headerView.moneyTF.text.doubleValue == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入充值金额!"];
        return;
    }
    if (self.headerView.moneyTF.text.doubleValue > 50000) {
        [SVProgressHUD showErrorWithStatus:@"单笔充值金额不能超过5万!"];
        return;
    }
    
    [self updateFile];
    
//    self.chongzhiButton.userInteractionEnabled = NO;
//    WeakObj(self);
//    [LxmNetworking networkingPOST:up_recharge parameters:dict returnClass:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        [SVProgressHUD dismiss];
//        selfWeak.chongzhiButton.userInteractionEnabled = YES;
//        if ([responseObject[@"key"] integerValue] == 1000) {
//            [SVProgressHUD showSuccessWithStatus:@"已提交充值申请!"];
//            if (self.currentIndex == 0) {//支付宝
//                NSString *payStr = responseObject[@"result"][@"data"];
//                if (payStr.isValid) {
//                    [[AlipaySDK defaultService] payOrder:payStr fromScheme:@"com.biuwork.yumeiren.alipaysafety" callback:nil];
//                } else {
//                    [SVProgressHUD showErrorWithStatus:@"支付信息获取失败!"];
//                }
//
//            } else {//微信
//                NSDictionary * dict = responseObject[@"result"][@"map"];
//                NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
//                //调起微信支付
//                PayReq* req             = [[PayReq alloc] init];
//                req.partnerId           = [dict objectForKey:@"partnerid"];
//                req.prepayId            = [dict objectForKey:@"prepayid"];
//                req.nonceStr            = [dict objectForKey:@"noncestr"];
//                req.timeStamp           = stamp.intValue;
//                req.package             = [dict objectForKey:@"package"];
//                req.sign                = [dict objectForKey:@"sign"];
//                [WXApi sendReq:req];
//            }
//
//        } else {
//            [UIAlertController showAlertWithmessage:responseObject[@"message"]];
//        }
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        selfWeak.chongzhiButton.userInteractionEnabled = YES;
//    }];
}

/**
 多张图片上传
 */
- (void)updateFile {
    [SVProgressHUD showWithStatus:@"正在上传图片,请稍后..."];
    [LxmNetworking NetWorkingUpLoad:Base_upload_multi_img_URL images:self.picArr parameters:nil name:@"files" success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject[@"key"] integerValue] == 1000) {
            [SVProgressHUD dismiss];
            NSArray *arr = responseObject[@"result"][@"list"];
            if ([arr isKindOfClass:NSArray.class]) {
                for (NSDictionary *dict in arr) {
                     LxmPublishTouSutModel *model = [LxmPublishTouSutModel mj_objectWithKeyValues:dict];
                    [self.imgs addObject:model.path];
                }
               
            }
            [self tijiao];
        } else {
            [SVProgressHUD dismiss];
            [UIAlertController showAlertWithmessage:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD dismiss];
    }];
}


- (void)tijiao {
    
    NSMutableDictionary *dict = @{
                           @"token" : SESSION_TOKEN,
                           @"payMoney" : self.headerView.moneyTF.text,
                           @"type" : @(3),
                           @"info_type":@(2-self.currentIndex),
                           
    }.mutableCopy;
    dict[@"payImg"] = [self.imgs componentsJoinedByString:@","];
    [SVProgressHUD show];
     self.chongzhiButton.userInteractionEnabled = NO;
    [LxmNetworking networkingPOST:up_recharge parameters:dict returnClass:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
         self.chongzhiButton.userInteractionEnabled = YES;
        if ([responseObject[@"key"] integerValue] == 1000) {
            [SVProgressHUD showSuccessWithStatus:@"已提交充值申请!"];
            
            
            
            
        }else {
           [UIAlertController showAlertWithmessage:responseObject[@"message"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD dismiss];
         self.chongzhiButton.userInteractionEnabled = YES;
        
    }];
    
    
}

- (void)zhiFuBaoNoti:(NSNotification *)noti{
    NSDictionary *resultDic = noti.object;
    if ([resultDic[@"resultStatus"] isEqualToString:@"6001"]) {
        //用户取消支付
        [SVProgressHUD showErrorWithStatus:@"取消支付"];
        
    } else if ([resultDic[@"resultStatus"] isEqualToString:@"9000"]) {
        [SVProgressHUD showSuccessWithStatus:@"充值成功"];
        [LxmEventBus sendEvent:@"chargeSuccess" data:nil];
        [self loadMyUserInfoWithOkBlock:nil];
        [LxmEventBus sendEvent:@"chongzhiSuccess" data:nil];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [SVProgressHUD showErrorWithStatus:@"支付失败"];
    }
}

- (void)wechatPayNoti:(NSNotification *)noti{
    BaseResp * resp = noti.object;
    if (resp.errCode==WXSuccess) {
        [SVProgressHUD showSuccessWithStatus:@"支付成功"];
        [LxmEventBus sendEvent:@"chargeSuccess" data:nil];
        [self loadMyUserInfoWithOkBlock:nil];
        [LxmEventBus sendEvent:@"chongzhiSuccess" data:nil];
        [self.navigationController popViewControllerAnimated:YES];
    } else if (resp.errCode==WXErrCodeUserCancel) {
        [SVProgressHUD showErrorWithStatus:@"用户取消了支付"];
    } else {
        [SVProgressHUD showErrorWithStatus:@"支付失败"];
    }
}

@end




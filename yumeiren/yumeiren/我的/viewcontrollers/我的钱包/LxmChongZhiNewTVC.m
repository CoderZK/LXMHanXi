//
//  LxmChongZhiNewTVC.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmChongZhiNewTVC.h"

@interface LxmChongZhiNewTVC ()
@property (nonatomic, strong) UILabel *textLabel;//充值金额

@property (nonatomic, strong) UILabel *yuanlabel;//元

@property (nonatomic, strong) UITextField *moneyTF;//输入的钱数

@property (nonatomic, strong) UIView *lineView;//线

@property (nonatomic, strong) UILabel *textLabel11;//单笔充值不能超过50000

@property(nonatomic,strong)UIView *headV;

@end

@implementation LxmChongZhiNewTVC

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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"充值";
    
    self.headV = [[UIView alloc] init];
    
    
    
    
    
    
}


@end

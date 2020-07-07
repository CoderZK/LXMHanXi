//
//  LxmZhuanChuJiFenVC.m
//  yumeiren
//
//  Created by zk on 2020/7/2.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmZhuanChuJiFenVC.h"

@interface LxmZhuanChuJiFenVC ()
@property (weak, nonatomic) IBOutlet UITextField *TF;
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UIButton *confirmBt;

@end

@implementation LxmZhuanChuJiFenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title  = @"转出小晞";
    self.confirmBt.layer.cornerRadius = 5;
    self.confirmBt.clipsToBounds = YES;
}
- (IBAction)confirmBt:(id)sender {
    if (self.TF.text.length  ==0 ){
        [SVProgressHUD showErrorWithStatus:@"请输入转出小晞"];
        return;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

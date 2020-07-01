//
//  LxmChongZhiPiceCell.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmChongZhiPiceCell.h"

@interface LxmChongZhiPiceCell()
@property(nonatomic,strong)UIScrollView *scrollview;
@end


@implementation LxmChongZhiPiceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, ScreenW, (ScreenW - 60)/3)];
        [self addSubview:self.scrollview];
        
        
    }
    return self;
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    [self addPicWithArr:dataArray];
}


- (void)addPicWithArr:(NSMutableArray *)picsArr {

    [self.scrollview.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    for (int i = 0 ; i < picsArr.count; i++) {
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(15 +  ((ScreenW - 60) /3 +15 )* i , 0, (ScreenW - 60) /3, (ScreenW - 60) /3)];
        button.layer.cornerRadius = 3;
        button.tag = 100+i;
        button.clipsToBounds = YES;
        button.backgroundColor = RGB(250, 250, 250);
        [button setBackgroundImage:picsArr[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollview addSubview:button];
        
        UIButton * deleteBt = [[UIButton alloc] initWithFrame:CGRectMake((ScreenW - 60) /3 - 20 , 0, 20, 20)];
        [deleteBt setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        deleteBt.tag = 200+i;
        deleteBt.backgroundColor = RGB(245, 245, 245);
        [deleteBt setBackgroundImage:picsArr[i] forState:UIControlStateNormal];
        [deleteBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addSubview:deleteBt];
        self.scrollview.contentSize = CGSizeMake(15 + (15 + (ScreenW - 60)/3) * picsArr.count, (ScreenW - 60)/3);
    }
        
    if (picsArr.count < 9) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(15 +  ((ScreenW - 60) /3 +15)* picsArr.count , 0, (ScreenW - 60) /3, (ScreenW - 60) /3)];
        button.layer.cornerRadius = 3;
        button.tag = 100+picsArr.count;
        button.clipsToBounds = YES;
        button.backgroundColor = RGB(245, 245, 245);
        [button setImage:[UIImage imageNamed:@"kk30"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollview addSubview:button];
        self.scrollview.contentSize = CGSizeMake(15 + (15 + (ScreenW - 60)/3) * (picsArr.count + 1), (ScreenW - 60)/3);
    }else {
        self.scrollview.contentSize = CGSizeMake(15 + (15 + (ScreenW - 60)/3) * picsArr.count, (ScreenW - 60)/3);
    }
    
    
}


//点击图片
- (void)clickAction:(UIButton *)button {
    
    if (button.tag >=200) {
        [self.dataArray removeObjectAtIndex:button.tag - 200];
        [self addPicWithArr:self.dataArray];
    }else {
        if (button.tag - 100  == self.dataArray.count) {
            
            if (self.choosePhotoBlock != nil) {
                self.choosePhotoBlock();
            }
            
        }
    }
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

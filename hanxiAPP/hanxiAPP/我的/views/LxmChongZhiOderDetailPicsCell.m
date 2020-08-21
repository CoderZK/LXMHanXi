//
//  LxmChongZhiOderDetailPicsCell.m
//  yumeiren
//
//  Created by zk on 2020/7/6.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmChongZhiOderDetailPicsCell.h"
#import "zkPhotoShowVC.h"
@interface LxmChongZhiOderDetailPicsCell()
@property(nonatomic,strong)UIView *picsView;
@end

@implementation LxmChongZhiOderDetailPicsCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.picsView = [[UIView alloc] initWithFrame:CGRectMake(15, 10, ScreenW - 30, 20)];
               for (int i = 0 ; i < 9 ; i ++) {
                   
                   UIImageView * imageView= [[UIImageView alloc] init];
                   imageView.contentMode = UIViewContentModeScaleAspectFill;
                   imageView.clipsToBounds = YES;
                   imageView.tag = i+100;
                   imageView.userInteractionEnabled = YES;
                   UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInView:)];
                   tap.cancelsTouchesInView = YES;//设置成N O表示当前控件响应后会传播到其他控件上，默认为YES
                   [imageView addGestureRecognizer:tap];
                   [self.picsView addSubview:imageView];
                   imageView.layer.cornerRadius = 5;
                   imageView.clipsToBounds = YES;
               }
               
               [self addSubview:self.picsView];
        
        
    }
    return self;
}

- (void)tapInView:(UITapGestureRecognizer *)tap {
    
    UIImageView * imgV = (UIImageView *)tap.view;
    NSInteger tag = imgV.tag - 100;
    NSArray * arr = [self.pics componentsSeparatedByString:@","];
    NSMutableArray * picArr = @[].mutableCopy;
    for (NSString * str  in arr) {
        [picArr addObject:[NSString stringWithFormat:@"%@",str]];
    }
    
    [[zkPhotoShowVC alloc] initWithArray:picArr index:tag];
    
}

- (void)setPics:(NSString *)pics {
    _pics = pics;
    if (pics.length == 0) {
        [self setImgViews:@[]];
    }else {
       [self setImgViews:[pics componentsSeparatedByString:@","]];
    }
}

- (void)setImgViews:(NSArray *)arr {
//        arr = @[@"http://p0.qhimgs4.com/t01d406e56973481579.jpg",@"http://5b0988e595225.cdn.sohucs.com/images/20190508/a3df05de51954e2891f829380af31754.jpeg",@"http://5b0988e595225.cdn.sohucs.com/images/20190507/2e2a6a6e43304433bd7a558292fcb487.jpeg"];
    
    
    for (NSInteger i = arr.count; i < 9; i++) {
        UIImageView * imgV = [self.picsView viewWithTag:100+i];
        imgV.hidden = YES;
    }
    if (arr.count == 0 ) {
        self.picsView.mj_h = 0;
        return;
    }
    
    CGFloat space = 10;
    CGFloat ww = (ScreenW - 20 -  30) / 3;
    CGFloat hh = 0;
    for (int i = 0 ; i < arr.count; i++) {
        UIImageView * imgV = [self.picsView viewWithTag:100+i];
        imgV.hidden = NO;
//        [imgV sd_setImageWithURL:[NSURL URLWithString:arr[i]] placeholderImage:[UIImage imageNamed:@"tupian"] options:SDWebImageRetryFailed];
//        if (arr.count == 1) {
//            //一张图片的布局
//            imgV.mj_size = CGSizeMake(ww, ww);
//            imgV.mj_x = 0;
//            imgV.mj_y = 0;
//            hh = ww;
//
//        }else if (arr.count == 4) {
//            //四张的布局
//            imgV.mj_size = CGSizeMake(ww, ww);
//            imgV.mj_x = (ww + space) * (i % 2);
//            imgV.y = (ww + space) * (i / 2);
//            hh = CGRectGetMaxY(imgV.frame);
//
//        }else {
//            imgV.size = CGSizeMake(ww, ww);
//            imgV.x = (ww + space) * (i % 3);
//            imgV.y = (ww + space) * (i / 3);
//            hh = CGRectGetMaxY(imgV.frame);
//        }
        
        imgV.mj_size = CGSizeMake(ww, ww);
        imgV.mj_x = (ww + space) * (i % 3);
        imgV.mj_y = (ww + space) * (i / 3);
        hh = CGRectGetMaxY(imgV.frame);
        
        [imgV sd_setImageWithURL:[NSURL URLWithString:arr[i]] placeholderImage:[UIImage imageNamed:@"tupian"] options:SDWebImageRetryFailed];
    }
    self.picsView.mj_h = hh;
    
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

//
//  LxmChongZhiPiceCell.m
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmChongZhiPiceCell.h"

@interface LxmChongZhiPiceCell()<UITextFieldDelegate>
@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)UILabel *titleLB;
@property (nonatomic, strong) UIPasteboard *pasteboard;
@end


@implementation LxmChongZhiPiceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.pasteboard = [UIPasteboard generalPasteboard];
  
        
        self.titleLB = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, ScreenW- 30, 40)];
        self.titleLB.font = [UIFont systemFontOfSize:14];
        self.titleLB.textColor = CharacterDarkColor;
        self.titleLB.numberOfLines = 2;
        self.titleLB.userInteractionEnabled = YES;
        [self addSubview:self.titleLB];
        self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 5+50, ScreenW, (ScreenW - 60)/3)];
        [self addSubview:self.scrollview];
        [self attachLongTapHandle];
        
    }
    return self;
}

- (void)attachLongTapHandle {
   self.titleLB.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPre:)];
    [self.titleLB addGestureRecognizer:longPress];

    //    UILongPressGestureRecognizer *longPress = [UILongPressGestureRecognizer  bk_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
    //        // 防止长按之后连续触发该事件
    //        if (sender.state == UIGestureRecognizerStateBegan) {
    //            // UILabel成为第一响应者
    //            [self.titleLB becomeFirstResponder];
    //            UIMenuController *menuVC = [UIMenuController sharedMenuController];
    //            [menuVC setTargetRect:self.frame inView:self.superview];
    //            [menuVC setMenuVisible:YES animated:YES];
    //        }
    //    }];
    [self.titleLB addGestureRecognizer:longPress];
}

// 使label能够成为响应事件，为了能接收到事件（能成为第一响应者）
- (BOOL)canBecomeFirstResponder{
return YES;
}
// 可以控制响应的方法
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
return (action == @selector(copy:));
}
//针对响应方法的实现，最主要的复制的两句代码
- (void)copy:(id)sender{

//UIPasteboard：该类支持写入和读取数据，类似剪贴板
UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
pasteBoard.string = self.titleLB.text;
}
// 处理长按事件
- (void)longPre:(UILongPressGestureRecognizer *)recognizer{
[self becomeFirstResponder]; // 用于UIMenuController显示，缺一不可

//UIMenuController：可以通过这个类实现点击内容，或者长按内容时展示出复制等选择的项，每个选项都是一个UIMenuItem对象
UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
[[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
[[UIMenuController sharedMenuController] setTargetRect:self.titleLB.frame inView:self.titleLB.superview];
[[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
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
        //        deleteBt.backgroundColor = RGB(250, 250, 250);
        //        [deleteBt setBackgroundImage:picsArr[i] forState:UIControlStateNormal];
        [deleteBt addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addSubview:deleteBt];
        self.scrollview.contentSize = CGSizeMake(15 + (15 + (ScreenW - 60)/3) * picsArr.count, (ScreenW - 60)/3);
    }
    
    if (picsArr.count < 9) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(15 +  ((ScreenW - 60) /3 +15)* picsArr.count , 0, (ScreenW - 60) /3, (ScreenW - 60) /3)];
        button.layer.cornerRadius = 3;
        button.tag = 100+picsArr.count;
        button.clipsToBounds = YES;
        button.backgroundColor = RGB(250, 250, 250);
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

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLB.text = titleStr;
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

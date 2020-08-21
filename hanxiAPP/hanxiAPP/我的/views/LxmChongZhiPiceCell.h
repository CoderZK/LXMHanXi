//
//  LxmChongZhiPiceCell.h
//  yumeiren
//
//  Created by zk on 2020/7/1.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface LxmChongZhiPiceCell : UITableViewCell
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,copy)void(^choosePhotoBlock)();
@property(nonatomic,strong)NSString *titleStr;
@end


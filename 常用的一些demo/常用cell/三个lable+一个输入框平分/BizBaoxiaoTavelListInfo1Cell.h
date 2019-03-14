//
//  BizBaoxiaoTavelListInfo1Cell.h
//  tn_sfa
//
//  Created by Mac on 2018/5/7.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BizBaoxiaoTavelListInfo1Cell : UITableViewCell
@property (nonatomic,copy) void(^deleteBlock)(NSString *str, NSInteger index);
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UITextField *dayNumber;

@end

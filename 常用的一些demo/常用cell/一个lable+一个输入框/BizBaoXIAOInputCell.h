//
//  BizBaoXIAOInputCell.h
//  tn_sfa
//
//  Created by Mac on 2018/5/7.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BizBaoXIAOInputCell : UITableViewCell
@property (nonatomic,copy) void(^deleteBlock)(NSString *str);
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextField *textView;

@end

//
//  BizTwoLableCell.h
//  tn_sfa
//
//  Created by 代佳宏 on 2018/5/30.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BizBalance.h"

@interface BizTwoLableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *lable2;
-(void)modeldata:(BizBalance *)model title:(NSString *)titletext indexpath:(NSIndexPath *)index;
@end

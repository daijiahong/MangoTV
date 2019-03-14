//
//  BizTwoLableCell.m
//  tn_sfa
//
//  Created by 代佳宏 on 2018/5/30.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizTwoLableCell.h"
#import "BizBalance.h"

@implementation BizTwoLableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)modeldata:(BizBalance *)model title:(NSString *)titletext indexpath:(NSIndexPath *)index{
    switch (index.row) {
      case 1:
                        self.label1.text = @"现金余额";
                        self.lable2.text = model.cashBalance;
    break;
case 2:
    self.label1.text = @"广宣基金账户";
    self.lable2.text = model.gxpBalance;
    break;
case 3:
                        self.label1.text = @"换新大电池账户";
                        self.lable2.text = model.bigBattery;
    break;
case 4:
//    [cell modeldata:self.datas title:@"换新小电池账户" indexpath:indexPath];
                        self.label1.text = @"换新小电池账户";
                        self.lable2.text = model.litterBattery;
    break;
case 5:
//    [cell modeldata:self.datas title:@"售后积分账户" indexpath:indexPath];
                        self.label1.text = @"售后积分账户";
                        self.lable2.text = model.saledTotalPoint;
    break;
default:
    break;
}
}
@end

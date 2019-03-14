//
//  BizTreeImageCell.m
//  tn_sfa
//
//  Created by Mac on 2018/5/9.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizTreeImageCell.h"

@implementation BizTreeImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didchose:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    if (self.btnClickBlock) {
        self.btnClickBlock(indexPath, sender.selected);
    }
}
@end

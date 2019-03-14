//
//  BizBaoxiaoTavelListInfo1Cell.m
//  tn_sfa
//
//  Created by Mac on 2018/5/7.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizBaoxiaoTavelListInfo1Cell.h"
@interface BizBaoxiaoTavelListInfo1Cell ()<UITextFieldDelegate>

@end
@implementation BizBaoxiaoTavelListInfo1Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.dayNumber.returnKeyType =UIReturnKeyDone;
    self.dayNumber.delegate =self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.deleteBlock){
        self.deleteBlock(self.dayNumber.text,self.dayNumber.tag);
    }
    NSLog(@"编辑结束");
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;//5.1前设置NO为点击无效
    
}
@end

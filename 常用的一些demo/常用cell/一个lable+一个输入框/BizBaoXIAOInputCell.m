//
//  BizBaoXIAOInputCell.m
//  tn_sfa
//
//  Created by Mac on 2018/5/7.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizBaoXIAOInputCell.h"
@interface BizBaoXIAOInputCell ()<UITextFieldDelegate>

@end
@implementation BizBaoXIAOInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textView.returnKeyType =UIReturnKeyDone;
    self.textView.delegate =self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.deleteBlock){
        self.deleteBlock(self.textView.text);
    }
    NSLog(@"编辑结束");
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{    
    [textField resignFirstResponder];
    return YES;//5.1前设置NO为点击无效
    
}
@end

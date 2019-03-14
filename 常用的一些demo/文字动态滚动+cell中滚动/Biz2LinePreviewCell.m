//
//  Biz3LinePreviewCell.m
//  tn_sfa
//
//  Created by zero on 2018/4/12.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "Biz2LinePreviewCell.h"

@implementation Biz2LinePreviewCell

- (void)awakeFromNib {
    _textView = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(20, 45, [UIScreen mainScreen].bounds.size.width-20, 30)];
    [super awakeFromNib];
    _textView.delegate        = self;
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.textColor       = [UIColor blackColor];
    _textView.textFont        = [UIFont systemFontOfSize:15.f];
    _textView.textAlignment   = NSTextAlignmentLeft;
    _textView.touchEnable     = YES;
    [self addSubview:_textView];
}
- (void)refreshCellWithTitle:(NSString *)title msgs:(NSArray<NSString *> *)msgs {
    self.lblTitle.text = title;
//  _textView.textDataArr =  @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555"];
     _textView.textDataArr = msgs;
    [_textView startScrollBottomToTopWithNoSpace];
}
- (IBAction)btnClicked:(UIButton *)sender {
    if (self.btnClickBlock) {
        self.btnClickBlock(sender.tag-100);
    }
}
#pragma mark - LMJScrollTextView2 Delegate
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
//    NSLog(@"当前是信息%ld",index);
}
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content{
//    NSLog(@"#####点击的是：第%ld条信息 内容：%@",index,content);
    self.btnClickBlock(index);
}
@end

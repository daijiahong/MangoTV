//
//  Biz3LinePreviewCell.h
//  tn_sfa
//
//  Created by zero on 2018/4/12.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizBaseTableViewCell.h"
#import "LMJScrollTextView2.h"
#import "AViewController.h"
@interface Biz2LinePreviewCell : UITableViewCell<LMJScrollTextView2Delegate>
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnMore;
//@property (weak, nonatomic) IBOutlet LMJScrollTextView2 *textView;
@property(nonatomic ,strong)LMJScrollTextView2 *textView;
@property (nonatomic,copy) void(^btnClickBlock)(NSInteger index);

- (void)refreshCellWithTitle:(NSString *)title msgs:(NSArray<NSString *> *)msgs;

@end

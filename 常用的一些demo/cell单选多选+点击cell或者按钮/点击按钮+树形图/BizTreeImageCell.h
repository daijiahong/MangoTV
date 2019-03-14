//
//  BizTreeImageCell.h
//  tn_sfa
//
//  Created by Mac on 2018/5/9.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BizTreeImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *choseBut;
@property (weak, nonatomic) IBOutlet UIImageView *imageOpen;
@property (nonatomic,copy) void(^btnClickBlock)(NSIndexPath *index,BOOL isState);
@end

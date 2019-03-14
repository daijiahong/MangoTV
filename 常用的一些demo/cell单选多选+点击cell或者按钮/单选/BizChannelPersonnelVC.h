//
//  BizChannelPersonnelVC.h
//  tn_sfa
//
//  Created by Mac on 2018/5/5.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizBaseTableVC.h"
#import "BizBaoxiaoModel.h"
typedef void(^callBackf)(BizBaoxiaoChannelPersonnelModel *mole);
@interface BizChannelPersonnelVC : BizBaseTableVC
@property (nonatomic, copy) callBackf userBaseInfoCallBack;

@end

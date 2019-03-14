//
//  BizTreeImageViewController.h
//  tn_sfa
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//


#import "BizBaseTableVC.h"
@interface BizTreeImageViewController : BizBaseTableVC
@property(nonatomic,copy) void(^btnClickBlock)(NSString *txet);
@end

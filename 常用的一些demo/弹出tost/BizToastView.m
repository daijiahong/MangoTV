//
//  BizToastView.m
//  WineCellar-Delivery
//
//  Created by zero on 2017/12/25.
//  Copyright © 2017年 www.tcjk.com. All rights reserved.
//

#import "BizToastView.h"
#import "AppDelegate.h"
@implementation BizToastView

+ (instancetype)toast:(NSString *)toast {
    if (![toast isKindOfClass:[NSString class]] || toast.length==0) {
        return nil;
    }
    BizToastView *toastView = [[BizToastView alloc] initWithFrame:CGRectZero];
    CGFloat margin = 5;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 40)];
    lbl.text = toast;
    lbl.frame = CGRectMake(margin, margin, width*0.8, 20);
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.numberOfLines = 0;
    lbl.alpha = 1.0;
    lbl.textColor = [UIColor whiteColor];
    [lbl sizeToFit];
    toastView.center = CGPointMake(width/2.0, height-80);
    toastView.bounds = CGRectMake(0, 0, MAX(lbl.bounds.size.width+2*margin, width*0.8), lbl.bounds.size.height+2*margin);
    CGPoint center = lbl.center;
    center.x = toastView.bounds.size.width/2.0;
    lbl.center = center;
    [toastView addSubview:lbl];
    toastView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    toastView.layer.cornerRadius = 6;
    toastView.layer.masksToBounds = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:toastView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            toastView.alpha = 0;
        } completion:^(BOOL finished) {
            [toastView removeFromSuperview];
        }];
    });
    return toastView;
}

- (UIView *)topWindow {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return delegate.window;
}

@end

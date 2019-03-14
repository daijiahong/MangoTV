//
//  BizDiQingShareModel.m
//  tn_sfa
//
//  Created by Mac on 2018/4/19.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizDiQingShareModel.h"

@implementation BizDiQingShareModel

@end

@implementation BizOrganization

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"spaceOrgName":@"orgName"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"children":self};
}

- (BOOL)isEqual:(BizOrganization *)object {
    return [self.id isEqual:object.id];
}

@end

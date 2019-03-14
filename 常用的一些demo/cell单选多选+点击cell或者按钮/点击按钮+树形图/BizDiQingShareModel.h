//
//  BizDiQingShareModel.h
//  tn_sfa
//
//  Created by Mac on 2018/4/19.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BizDiQingShareModel : NSObject
@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *businessId;
@property (nonatomic,copy) NSString *receiveUser;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *createName;
@property (nonatomic,copy) NSString *createTime;
@property (nonatomic,copy) NSString *contactsPhone;
@property (nonatomic,copy) NSString *gpsAddress;
@property (nonatomic,copy) NSString *orgName;
@property (nonatomic,copy) NSString *subFlag;
@property (nonatomic,copy) NSString *orgId;

@property (nonatomic,copy) NSString *receiveFullName;
@property (nonatomic,copy) NSString *describe;
@property (nonatomic,strong)NSArray *picVoList;
@property (nonatomic,copy) NSString *imgPath;
@property (nonatomic,copy) NSString *positionName;
//@property (nonatomic,copy) NSString *receiveUser;
@property (nonatomic,copy) NSString *contacts;
@end

@interface BizOrganization : NSObject<YYModel>

@property (nonatomic,assign) BOOL isOpen;
@property (nonatomic,assign) NSUInteger hierarchy;

@property (nonatomic,copy) NSString *id;
@property (nonatomic,copy) NSString *parentId;
@property (nonatomic,assign)BOOL isEditor;
@property (nonatomic,copy) NSString *orgName;
@property (nonatomic,copy) NSString *spaceOrgName;
@property (nonatomic,copy) NSArray<BizOrganization *> *children;

@end


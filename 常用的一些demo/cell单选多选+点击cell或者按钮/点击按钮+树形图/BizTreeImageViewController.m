//
//  BizTreeImageViewController.m
//  tn_sfa
//
//  Created by Mac on 2018/5/8.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizTreeImageViewController.h"
#import "BizDiQingShareModel.h"
#import "BizTreeImageCell.h"
@interface BizTreeImageViewController ()
@property (nonatomic,strong) DPHTTPSessionDataTask *topContactsTask;
@property (nonatomic,strong) BizOrganization *organization;
@property (nonatomic,strong) NSMutableArray *muteOrganList;

@end

@implementation BizTreeImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.muteOrganList = @[].mutableCopy;
    [self updata];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确认选择" style:UIBarButtonItemStyleDone target:self action:@selector(add)];
}

-(void)add{
    NSString *str;
    for (BizOrganization *model in self.muteOrganList) {
        if (model.isEditor) {
            if (!str) {
                str = model.id;
            }else{
                str = [NSString stringWithFormat:@"%@,%@",str,model.id];
            }
        }
    }
    
    if (!str) {
        [BizToastView toast:@"还没选择组织"];
        return;
    }
    if (self.btnClickBlock) {
        self.btnClickBlock(str);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)updata{
    @weakify(self);
    NSMutableDictionary *p = @{}.mutableCopy;
    p[@"orgType"] = @"SYB";
    p[@"positionName"] = [BizCoreData shareInstance].userInfo.userInfoEntity.posName;
    p[@"orgId"] = [BizCoreData shareInstance].userInfo.userInfoEntity.departId;
    self.topContactsTask = [[BizCoreManager sharedInstance] performHttpTaskWithTaskName:nil Uri:@"tmOrgForSfaController.do?findTheOrgInfo" Header:nil Parameters:p Background:NO Completion:^(DPHTTPSessionResponse * _Nullable response, NSError * _Nullable error) {
        @strongify(self);
        if (!error) {
            self.organization = [BizOrganization yy_modelWithJSON:response.contentJson[@"businessObject"]];
            [self.muteOrganList addObject:self.organization];
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.muteOrganList.count;
}
static NSString *ID = @"BizTreeImageCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BizTreeImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:ID owner:self options:nil]lastObject];
    }
    BizOrganization *model = self.muteOrganList[indexPath.row];
    cell.choseBut.selected = model.isEditor;
    cell.choseBut.tag = indexPath.row;
//    if (model.isOpen) {
//        cell.imageOpen.image  = [UIImage imageNamed:@"xuanze"];
//    }else{
//        cell.imageOpen.image  = [UIImage imageNamed:@"next"];
//    }
    NSString *string1 = model.spaceOrgName;
    NSString *subString1 = @" ";
    NSArray *array = [string1 componentsSeparatedByString:subString1];
    NSInteger count = [array count] - 1;
    
    
    NSMutableAttributedString *attri =     [[NSMutableAttributedString alloc] initWithString:model.spaceOrgName];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    if (model.isOpen) {
        attch.image  = [UIImage imageNamed:@"xuanze"];
    }else{
        attch.image  = [UIImage imageNamed:@"next"];
    }
//    attch.image = [UIImage imageNamed:@"parking_caveat_normal"];
    attch.bounds = CGRectMake(0, 0, 20/2, 20/2);
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
//    [attri appendAttributedString:string];
    [attri insertAttributedString:string atIndex:count];
    
    
//    实例化的lable.attributedText = attri;
    
    
    cell.btnClickBlock = ^(NSIndexPath *index, BOOL isState) {
        BizOrganization *model = self.muteOrganList[indexPath.row];
        model.isEditor = isState;
    };
    cell.textLabel.attributedText = attri;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BizOrganization *model = self.muteOrganList[indexPath.row];
    if (!model.isOpen) { //关闭状态
        [self addChildCellForModel:model atIndexPath:indexPath];
    } else {
        NSMutableArray *a = @[].mutableCopy;
        [self closeAllCellForModel:model toTempArray:a];
        [self.muteOrganList removeObjectsInArray:a];
    }
    model.isOpen = !model.isOpen;
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)addChildCellForModel:(BizOrganization *)model atIndexPath:(NSIndexPath *)indexPath {
    NSArray<BizOrganization *> *children = [self.organization.children filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"parentId MATCHES %@",model.id]];
    for (BizOrganization *obj in children) {
        obj.hierarchy = model.hierarchy+1;
        NSMutableString *space = @"".mutableCopy;
        for (int i = 0; i < obj.hierarchy; ++i) {
            [space appendString:@"     "];
        }
        obj.spaceOrgName = [space stringByAppendingString:obj.orgName];
    }
    [self.muteOrganList insertObjects:children atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, children.count)]];
}

- (void)closeAllCellForModel:(BizOrganization *)model toTempArray:(NSMutableArray *)temp {
    NSArray<BizOrganization *> *children = [self.muteOrganList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"parentId MATCHES %@",model.id]];
    if (!children.count) {
        return;
    }
    [temp addObjectsFromArray:children];
    [children enumerateObjectsUsingBlock:^(BizOrganization * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isOpen) {
            obj.isOpen = NO;
            [self closeAllCellForModel:obj toTempArray:temp];
        }
    }];
}

@end

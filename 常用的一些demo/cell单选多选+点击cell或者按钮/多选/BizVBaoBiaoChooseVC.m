//
//  BizVBaoBiaoChooseVC.m
//  tn_sfa
//
//  Created by Mac on 2018/5/5.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizVBaoBiaoChooseVC.h"
#import "BizBaoxiaoReimbursementVC.h"
#import "BizBaoxiaoModel.h"


@interface BizVBaoBiaoChooseVC ()
@property (nonatomic,strong) DPHTTPSessionDataTask *topContactsTask;
@property (strong, nonatomic) NSMutableArray  *selectIndexs; //多选选中的行
@property (nonatomic,copy) NSArray<BizBaoxiaoChooseModel *> *topContacts;
@property (nonatomic,strong) NSMutableArray<BizBaoxiaoChooseModel *> *ChooseMoles;
@end

@implementation BizVBaoBiaoChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  =@"账单选择";
     _selectIndexs = [NSMutableArray new];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择完成" style:UIBarButtonItemStyleDone target:self action:@selector(add)];
    [self fetchTopContacts];
}
- (void)fetchTopContacts {
    @weakify(self);
    NSMutableDictionary *p = @{}.mutableCopy;
    p[@"page"] = @1;
    p[@"rows"] = @20;
    p[@"positionName"] = [BizCoreData shareInstance].userInfo.userInfoEntity.posName;
    p[@"orgId"] = [BizCoreData shareInstance].userInfo.userInfoEntity.departId;
    self.topContactsTask = [[BizCoreManager sharedInstance] performHttpTaskWithTaskName:nil Uri:@"tsChargeAnAccountController.do?findCouldAccTravelApplyByTravelIdList" Header:nil Parameters:p Background:NO Completion:^(DPHTTPSessionResponse * _Nullable response, NSError * _Nullable error) {
        @strongify(self);
        if (!error) {
            self.topContacts = [NSArray yy_modelArrayWithClass:[BizBaoxiaoChooseModel class] json:response.contentJson[@"businessObject"]];
            [self.tableView reloadData];
        }
    }];
}
-(void)add{
    self.ChooseMoles = [NSMutableArray arrayWithCapacity:0];
    for (NSIndexPath *index in _selectIndexs) {
        [self.ChooseMoles addObject:self.topContacts[index.row]];
    }
    if (self.ChooseMoles.count<1) {
        [BizToastView toast:@"还未选择账单"];
        return;
    }
    BizBaoxiaoReimbursementVC *vc = [[BizBaoxiaoReimbursementVC alloc]init];
    vc.ChooseMoles = self.ChooseMoles;
    vc.deleteBlock = ^(NSString *str) {
        [self fetchTopContacts];
    };
    [self pushAndHiddenBottomBarToVC:vc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topContacts.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
static NSString *cellid = @"cellid";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = [self.topContacts[indexPath.row] valueForKey:@"startAddress"];
    cell.accessoryType = UITableViewCellAccessoryNone;
        for (NSIndexPath *index in _selectIndexs) {
            if (indexPath == index) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) { //如果为选中状态
        cell.accessoryType = UITableViewCellAccessoryNone; //切换为未选中
        [_selectIndexs removeObject:indexPath]; //数据移除
    }else { //未选中
        cell.accessoryType = UITableViewCellAccessoryCheckmark; //切换为选中
        [_selectIndexs addObject:indexPath]; //添加索引数据到数组
    }
}

@end

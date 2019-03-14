//
//  BizChannelPersonnelVC.m
//  tn_sfa
//
//  Created by Mac on 2018/5/5.
//  Copyright © 2018年 biz.JunLeBao. All rights reserved.
//

#import "BizChannelPersonnelVC.h"
#import "BizBaoxiaoModel.h"
//#import "BizBaoxiaoReimbursementVC.h"

@interface BizChannelPersonnelVC ()
@property (nonatomic,strong) DPHTTPSessionDataTask *topContactsTask;
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行
@property (nonatomic,copy) NSArray<BizBaoxiaoChannelPersonnelModel *> *topContacts;
//@property (nonatomic,assign)BOOL fistdid;
@end

@implementation BizChannelPersonnelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  =@"渠道选择";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(add)];
    [self fetchTopContacts];
}
-(void)add{
    if (self.userBaseInfoCallBack) {
        self.userBaseInfoCallBack(self.topContacts[_selIndex.row]);

        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)fetchTopContacts {
    @weakify(self);
    NSMutableDictionary *p = @{}.mutableCopy;
    p[@"page"] = @1;
    p[@"rows"] = @20;
    p[@"positionName"] = [BizCoreData shareInstance].userInfo.userInfoEntity.posName;
    p[@"orgId"] = [BizCoreData shareInstance].userInfo.userInfoEntity.departId;
    self.topContactsTask = [[BizCoreManager sharedInstance] performHttpTaskWithTaskName:nil Uri:@"tsChargeAnAccountController.do?findTheChannelOffice" Header:nil Parameters:p Background:NO Completion:^(DPHTTPSessionResponse * _Nullable response, NSError * _Nullable error) {
        @strongify(self);
        if (!error) {
            self.topContacts = [NSArray yy_modelArrayWithClass:[BizBaoxiaoChannelPersonnelModel class] json:response.contentJson[@"businessObject"]];
            [self.tableView reloadData];
        }
    }];
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
    cell.textLabel.text = [self.topContacts[indexPath.row] valueForKey:@"dictValue"];
    if (_selIndex == indexPath) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //之前选中的，取消选择
    UITableViewCell *celled = [tableView cellForRowAtIndexPath:_selIndex];
    celled.accessoryType = UITableViewCellAccessoryNone;
    //记录当前选中的位置索引
    _selIndex = indexPath;
    //当前选择的打勾
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

@end

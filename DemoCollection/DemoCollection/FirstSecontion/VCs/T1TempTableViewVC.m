//
//  T1TempTableViewVC.m
//  416Demo
//
//  Created by 许龙 on 16/4/3.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "T1TempTableViewVC.h"
#import "TempTableViewCell.h"

@interface T1TempTableViewVC () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation T1TempTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;



}

#pragma mark - Privite Methods

#pragma mark - Delegate
#pragma mark UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TempTableViewCell *cell = [TempTableViewCell tempTableViewCellWith:tableView indexPath:indexPath];
    [cell configTempCellWith:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma makr - ReceiveMemoryWarn

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

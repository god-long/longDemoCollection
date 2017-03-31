//
//  FirstVC.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/15.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "FirstVC.h"
#import "FirstViewModel.h"

@interface FirstVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak  ) IBOutlet UITableView *contentTableView;/**< 显示TableView */

@property (nonatomic, strong) FirstViewModel *viewModel;/**< 数据源Model */

@end

@implementation FirstVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"demo集锦";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self getViewModel];
}

#pragma mark - System Methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Privite Methods
- (void)getViewModel {
    
    self.viewModel = [[FirstViewModel alloc] init];
    [_viewModel configViewModel];
    [_contentTableView reloadData];
}



#pragma mark - Delegate

#pragma mark UITableViewDataSource && UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _viewModel.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[_viewModel.dataArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *SecondTabIdentifier = @"SecondTabVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SecondTabIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SecondTabIdentifier];
    }
    NSDictionary *dic = [[_viewModel.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:kConfigTitle];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dic = [[_viewModel.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];

    UIViewController *tempVC = [[NSClassFromString([dic objectForKey:kConfigPushVC]) alloc] init];
    tempVC.title = [dic objectForKey:kConfigTitle];
    [self.navigationController pushViewController:tempVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
   
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

@end

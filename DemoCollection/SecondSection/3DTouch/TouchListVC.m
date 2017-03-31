//
//  TouchListVC.m
//  DemoCollection
//
//  Created by 许龙 on 2017/3/1.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import "TouchListVC.h"
#import "TouchListViewModel.h"
#import "TouchModel.h"
#import "TouchDetailVC.h"

@interface TouchListVC () <UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>

@property (nonatomic, weak  ) IBOutlet UITableView *tableView;

@property (nonatomic, strong) TouchListViewModel *listViewModel;

@end

@implementation TouchListVC

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 65;
    
    self.listViewModel = [[TouchListViewModel alloc] init];
    [_listViewModel configTouchListData];
    
    [self.tableView reloadData];
    
    //设置代理，forceTouchCapability是判断该设备是否支持3DTouch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }else {
        UIAlertController *tipsAlertVC = [UIAlertController alertControllerWithTitle:@"3DTouch提示" message:@"该设备不支持3DTouch" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [tipsAlertVC addAction:okAction];
        
        [self presentViewController:tipsAlertVC animated:YES completion:nil];
    }
}

#pragma mark - Privite Methods

- (void)showAlertWith:(NSString *)title message:(NSString *)message {
    UIAlertController *tipsAlertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [tipsAlertVC addAction:okAction];
    
    [self presentViewController:tipsAlertVC animated:YES completion:nil];
}

#pragma mark - Delegate

#pragma mark UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listViewModel.touchListDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"3DTouchList"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"3DTouchList"];
    }
    cell.textLabel.text = [(TouchModel *)[_listViewModel.touchListDataArray objectAtIndex:indexPath.row] title];
    cell.detailTextLabel.text = [[_listViewModel.touchListDataArray objectAtIndex:indexPath.row] subTitle];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark UIViewControllerPreviewingDelegate
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    //location找到对应数据源
    CGPoint convertPoint = [self.view convertPoint:location toView:self.tableView];
    NSIndexPath *clickIndexPath = [self.tableView indexPathForRowAtPoint:convertPoint];
    
    //设置Peek的sourceRect,sourceRect就是Peek动画弹出的位置，轻按的时候周围会虚化
    UITableViewCell *clickCell = [self.tableView cellForRowAtIndexPath:clickIndexPath];
    //sourceRect对应的是self.view坐标系中的rect，所以需要转换一下
    CGRect convertRect = [self.view convertRect:clickCell.frame fromView:self.tableView];
    previewingContext.sourceRect = convertRect;
    
    TouchDetailVC *detailVC = [[TouchDetailVC alloc] init];
    detailVC.touchModel = [_listViewModel.touchListDataArray objectAtIndex:clickIndexPath.row];
    //设置宽度没用，只设置高度就行了
    detailVC.preferredContentSize = CGSizeMake(0, 400);
    return detailVC;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    //这个就是Peek后再用力按就干什么的方法了
    [self showViewController:viewControllerToCommit sender:self];
}

#pragma makr - ReceiveMemoryWarn
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

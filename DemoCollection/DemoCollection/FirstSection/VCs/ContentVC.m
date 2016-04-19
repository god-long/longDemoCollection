//
//  ContentVC.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/17.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "ContentVC.h"
#import "FirstSectionViewModel.h"
#import "ContentTableViewCell.h"

@interface ContentVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak  ) IBOutlet UITableView *contentTableView;

@property (nonatomic, strong) FirstSectionViewModel *viewModel;

@end

@implementation ContentVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = [[FirstSectionViewModel alloc] init];
    [_viewModel configContentPriorityArray];
    [_contentTableView reloadData];
}

#pragma mark - System Methods



#pragma mark - Privite Methods




#pragma mark - Delegate
#pragma mark UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _viewModel.contentPriorityArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContentTableViewCell *cell = [ContentTableViewCell contentTableViewCellWith:tableView];
    [cell configContentCellWith:[_viewModel.contentPriorityArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}




#pragma makr - ReceiveMemoryWarn
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

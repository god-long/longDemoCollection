//
//  TouchListViewModel.m
//  DemoCollection
//
//  Created by 许龙 on 2017/3/1.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import "TouchListViewModel.h"
#import "TouchModel.h"

@implementation TouchListViewModel

- (NSMutableArray *)touchListDataArray {
    if (!_touchListDataArray) {
        _touchListDataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _touchListDataArray;
}

- (void)configTouchListData {
    
    for (NSInteger i = 0; i < 10; i++) {
        TouchModel *tempModel = [[TouchModel alloc] initWithTitle:[NSString stringWithFormat:@"第%ld",i] subTitle:[NSString stringWithFormat:@"我是第%ld的副标题",i]];
        [self.touchListDataArray addObject:tempModel];
    }
}


@end

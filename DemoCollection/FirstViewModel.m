//
//  FirstViewModel.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/15.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "FirstViewModel.h"

@implementation FirstViewModel

#pragma mark - Set Get Methods

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

- (NSMutableArray *)firstSectionArray {
    if (!_firstSectionArray) {
        self.firstSectionArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _firstSectionArray;
}

- (NSMutableArray *)secondSectionArray {
    if (!_secondSectionArray) {
        self.secondSectionArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _secondSectionArray;
}

- (NSMutableArray *)thirdSectionArray {
    if (!_thirdSectionArray) {
        self.thirdSectionArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _thirdSectionArray;
}


#pragma mark - Public Methods

- (void)configViewModel {
    
    NSArray *firstArray = @[
                            @{
                                kConfigTitle : @"Xib中创建多个Cell",
                                kConfigPushVC : @"T1TempTableViewVC"
                                },
                            
                            @{
                                kConfigTitle : @"Xib中内容优先级布局",
                                kConfigPushVC : @"ContentVC"
                                },
                            
                            @{
                                kConfigTitle : @"Xib中ScrollView使用",
                                kConfigPushVC : @"ScrollViewVC"
                                },
                            ];
    [self.firstSectionArray addObjectsFromArray:firstArray];
    
    NSArray *secondArray = @[
                             @{
                                 kConfigTitle : @"iOS7系统二维码扫描(设置扫描区域、中空区域)(需要真机)",
                                 kConfigPushVC : @"ScanCodeVC"
                                 },

                             @{
                                 kConfigTitle : @"自定义UICollectionViewFlowLayout",
                                 kConfigPushVC : @"CustomFlowLayoutVC"
                                 },

                             ];
    [self.secondSectionArray addObjectsFromArray:secondArray];
    
    NSArray *thirdArray = @[
                            @{
                                kConfigTitle : @"Third",
                                kConfigPushVC : @"nil"
                                },
                            
                            ];
    [self.thirdSectionArray addObjectsFromArray:thirdArray];
    
    [self.dataArray addObject:self.firstSectionArray];
    [self.dataArray addObject:self.secondSectionArray];
    [self.dataArray addObject:self.thirdSectionArray];
    
    
    
    
    
    
    
    
    
    
}

@end

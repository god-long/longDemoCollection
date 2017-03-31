//
//  TodayViewController.m
//  DomeToday
//
//  Created by 许龙 on 2017/3/23.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "MacrosHeaders.h"
#import "TodayModel.h"
#import "TodayShowCell.h"

@interface TodayViewController () <NCWidgetProviding, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *todayDataArray;

@end

#define TodayExtensionHeightCompact 110
#define TodayExtensionHeightExpanded

@implementation TodayViewController

- (NSMutableArray *)todayDataArray {
    if (!_todayDataArray) {
        _todayDataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _todayDataArray;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];


    [self createData];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

- (void)viewDidAppear:(BOOL)animated {

    [self widgetActiveDisplayModeDidChange:NCWidgetDisplayModeCompact withMaximumSize:CGSizeZero];
}

#pragma mark - Privite Methods
- (void)createData {
    NSArray *array = @[@{kTodayName : @"多个Cell"},
                       @{kTodayName : @"优先布局"},
                       @{kTodayName : @"ScrollView"},
                       @{kTodayName : @"二维码扫描"},
                       @{kTodayName : @"自定义FlowLayout"},
                       @{kTodayName : @"3DTouch"},
                       @{kTodayName : @"JSPatch"},
                       ];
    for (NSInteger i = 0; i < array.count; i++) {
        TodayModel *todayModel = [[TodayModel alloc] initTodayModelWith:[array objectAtIndex:i]];
        [self.todayDataArray addObject:todayModel];
    }
}


#pragma mark - Delegate

#pragma mark UICollectionViewDataSource && UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.todayDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TodayShowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TodayShowCell" forIndexPath:indexPath];
    
    TodayModel *model = [self.todayDataArray objectAtIndex:indexPath.item];
    cell.nameLabel.text = model.name;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}



- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    
    NSLog(@"%@", NSStringFromCGSize(maxSize));
    CGSize newSize = CGSizeZero;
    switch (activeDisplayMode) {
        case NCWidgetDisplayModeExpanded:
            newSize = CGSizeMake(0, 200);
            break;
        case NCWidgetDisplayModeCompact:
            newSize = CGSizeMake(0, 110);
            break;
    }

    self.preferredContentSize = newSize;
}

@end

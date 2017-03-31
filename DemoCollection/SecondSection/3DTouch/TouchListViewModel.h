//
//  TouchListViewModel.h
//  DemoCollection
//
//  Created by 许龙 on 2017/3/1.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchListViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *touchListDataArray;



- (void)configTouchListData;

@end

//
//  FirstSectionViewModel.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/19.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "FirstSectionViewModel.h"

@implementation FirstSectionViewModel

#pragma mark - Set && Get

- (NSMutableArray *)contentPriorityArray {
    if (!_contentPriorityArray) {
        self.contentPriorityArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _contentPriorityArray;
}

- (NSMutableArray *)customFlowLayoutArray {
    if (!_customFlowLayoutArray) {
        self.customFlowLayoutArray = [NSMutableArray arrayWithCapacity:0];
        for (NSInteger i = 0; i < 20; i++) {
            [_customFlowLayoutArray addObject:@{
                                                kConfigImage : [NSString stringWithFormat:@"one_piece_%ld",(long)i % 9]
                                                }];
        }
    }
    return _customFlowLayoutArray;
}



- (void)configContentPriorityArray {
    NSArray *contentArray = @[
                              @{
                                  kConfigTitle : @"左边内容少",
                                  kConfigContent : @"右边内容很多很多很多很多很多很多很多",
                                  },
                              @{
                                  kConfigTitle : @"左边内容少",
                                  kConfigContent : @"右边内容也少",
                                  },
                              @{
                                  kConfigTitle : @"左边内容很多很多很多很多很多很多很多很多",
                                  kConfigContent : @"右边内容少",
                                  },
                              @{
                                  kConfigTitle : @"左边内容很多很多很多很多很多很多很多很多",
                                  kConfigContent : @"右边内容很多很多很多很多很多很多很多很多",
                                  },

                              ];
    
    
    [self.contentPriorityArray addObjectsFromArray:contentArray];
 
}


@end

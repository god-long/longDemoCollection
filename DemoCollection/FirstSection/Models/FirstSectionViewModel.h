//
//  FirstSectionViewModel.h
//  DemoCollection
//
//  Created by 许龙 on 16/4/19.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstSectionViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *contentPriorityArray;/**< 显示优先级数据源 */

@property (nonatomic, strong) NSMutableArray *customFlowLayoutArray;/**< 自定义layout图片数据源 */


- (void)configContentPriorityArray;

@end

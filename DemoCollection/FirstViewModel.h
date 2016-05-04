//
//  FirstViewModel.h
//  DemoCollection
//
//  Created by 许龙 on 16/4/15.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *dataArray;/**< 总数据 */

@property (nonatomic, strong) NSMutableArray *firstSectionArray;/**< 第一个分区数据源 */

@property (nonatomic, strong) NSMutableArray *secondSectionArray;/**< 第二个分区数据源 */

@property (nonatomic, strong) NSMutableArray *thirdSectionArray;/**< 第三个分区数据源 */


- (void)configViewModel;

@end

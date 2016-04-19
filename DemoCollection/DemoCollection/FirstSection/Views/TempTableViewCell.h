//
//  TempTableViewCell.h
//  416Demo
//
//  Created by 许龙 on 16/4/3.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempTableViewCell : UITableViewCell

/**
 *  @author god~long, 16-04-03 15:04:19
 *
 *  初始化Cell的方法
 *
 *  @param tableView 对应的TableView
 *  @param indexPath 对应的indexPath
 *
 *  @return TempTableViewCell
 */
+ (instancetype)tempTableViewCellWith:(UITableView *)tableView
                            indexPath:(NSIndexPath *)indexPath;


/**
 *  @author god~long, 16-04-03 16:04:04
 *
 *  配置TempCell的方法
 *
 *  @param indexPath 对应TableView的indexPath
 */
- (void)configTempCellWith:(NSIndexPath *)indexPath;

@end

//
//  ContentTableViewCell.h
//  DemoCollection
//
//  Created by 许龙 on 16/4/17.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentTableViewCell : UITableViewCell

+ (instancetype)contentTableViewCellWith:(UITableView *)tableView;


/**
 *  @author god~long, 16-04-19 16:04:15
 *
 *  配置contentCell
 *
 *  @param dic 配置数据
 */
- (void)configContentCellWith:(NSDictionary *)dic;

@end

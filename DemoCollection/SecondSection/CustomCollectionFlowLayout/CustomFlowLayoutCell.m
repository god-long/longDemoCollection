//
//  CustomFlowLayoutCell.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/28.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "CustomFlowLayoutCell.h"

@implementation CustomFlowLayoutCell

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

@end

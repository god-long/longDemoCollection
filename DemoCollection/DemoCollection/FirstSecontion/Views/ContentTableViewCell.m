//
//  ContentTableViewCell.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/17.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "ContentTableViewCell.h"

@interface ContentTableViewCell ()

@property (nonatomic, weak  ) IBOutlet UILabel *leftLabel;/**< 左Label */

@property (nonatomic, weak  ) IBOutlet UILabel *rightLabel;/**< 右Label */

@end

@implementation ContentTableViewCell

- (void)awakeFromNib {


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

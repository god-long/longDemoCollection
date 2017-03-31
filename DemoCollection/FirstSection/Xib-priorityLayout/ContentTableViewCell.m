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

#pragma mark - Override
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _leftLabel.text = nil;
    _rightLabel.text = nil;
}

#pragma mark - Privite Methods

+ (instancetype)contentTableViewCellWith:(UITableView *)tableView {
    ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentTableViewCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ContentTableViewCell" owner:self options:nil] firstObject];
    }
    return cell;
}

- (void)configContentCellWith:(NSDictionary *)dic {
    _leftLabel.text = [dic objectForKey:kConfigTitle];
    _rightLabel.text = [dic objectForKey:kConfigContent];
}



@end

//
//  TempTableViewCell.m
//  416Demo
//
//  Created by 许龙 on 16/4/3.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "TempTableViewCell.h"

@interface TempTableViewCell ()

@property (nonatomic, weak  ) IBOutlet UILabel *label1;/**< Label1 */

@property (nonatomic, weak  ) IBOutlet UILabel *label2;/**< Label2 */

@property (nonatomic, weak  ) IBOutlet UIButton *customButton;/**< 自定义Button */

@property (nonatomic, weak  ) IBOutlet UIImageView *customImageView;/**< 自定义ImageView */

@end


@implementation TempTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


+ (instancetype)tempTableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"";//对应xib中设置的identifier
    NSInteger index = 0; //xib中第几个Cell
    switch (indexPath.row) {
        case 0:
            identifier = @"TempTableViewCellFirst";
            index = 0;
            break;
        case 1:
            identifier = @"TempTableViewCellSecond";
            index = 1;
            break;
        case 2:
            identifier = @"TempTableViewCellThird";
            index = 2;
            break;

        default:
            break;
    }
    TempTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TempTableViewCell" owner:self options:nil] objectAtIndex:index];
    }
    return cell;

}

- (void)configTempCellWith:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            _label1.text = @"我是Label1";
            _customImageView.image = [UIImage imageNamed:@"one-piece"];
            break;
        }
        case 1: {
            _label2.text = @"我是Label2";
            [_customButton setTitle:@"我是button" forState:UIControlStateNormal];
            break;
        }
        case 2: {
            _label1.text = @"我是第三个Cell的Label1";
            _label2.text = @"我是第三个Cell的Label2";
            break;
        }

        default:
            break;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

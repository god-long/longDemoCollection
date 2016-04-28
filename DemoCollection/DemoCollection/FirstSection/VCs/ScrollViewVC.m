//
//  ScrollViewVC.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/20.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "ScrollViewVC.h"

@interface ScrollViewVC ()

@property (nonatomic, weak  ) IBOutlet UIView *centerView;

@property (nonatomic, weak  ) IBOutlet NSLayoutConstraint *viewTop;

@property (nonatomic, weak  ) IBOutlet NSLayoutConstraint *viewLeading;

@property (nonatomic, weak  ) IBOutlet NSLayoutConstraint *viewTailing;

@property (nonatomic, weak  ) IBOutlet NSLayoutConstraint *viewHeight;

@property (nonatomic, assign) BOOL isOpen;/**< 开关 */

@end

@implementation ScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"xib中ScrollView";
    
    
}


#pragma mark - System Methods
- (IBAction)labelAction:(id)sender {
    if (_isOpen) {
        _isOpen = NO;
        [self.view layoutIfNeeded];
        [UIView animateWithDuration:1.5f delay:.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.viewTop.constant = self.viewTop.constant + 100;
            self.viewHeight.constant = self.viewHeight.constant - 100;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {

        }];
        
    }else {
        _isOpen = YES;
        [self.view layoutIfNeeded];
        [UIView animateWithDuration:1.5f delay:.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.viewTop.constant = self.viewTop.constant - 100;
            self.viewHeight.constant = self.viewHeight.constant + 100;
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {

        }];
    }
}

#pragma mark - Privite Methods



#pragma mark - Delegate



#pragma makr - ReceiveMemoryWarn
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

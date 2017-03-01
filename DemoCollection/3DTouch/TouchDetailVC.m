//
//  TouchDetailVC.m
//  DemoCollection
//
//  Created by 许龙 on 2017/3/1.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import "TouchDetailVC.h"
#import "TouchModel.h"
#import <SafariServices/SafariServices.h>

@interface TouchDetailVC () <UIViewControllerPreviewingDelegate>

@property (nonatomic, weak  ) IBOutlet UILabel *infoLabel;

@end

@implementation TouchDetailVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.infoLabel.text = self.touchModel.title;

    [self registerForPreviewingWithDelegate:self sourceView:self.infoLabel];
}


#pragma mark - Privite Methods

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    
    UIPreviewAction *firstItem = [UIPreviewAction actionWithTitle:@"确定" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%@",action.title);
    }];
    
    UIPreviewAction *secondItem = [UIPreviewAction actionWithTitle:@"喜欢" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%@",action.title);
    }];
    
    UIPreviewAction *thirdItem = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"%@",action.title);
    }];
    
    return @[firstItem, secondItem, thirdItem];
}


#pragma mark - Delegate

#pragma mark UIViewControllerPreviewingDelegate
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    previewingContext.sourceRect = previewingContext.sourceView.frame;
    
    return [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http:www.jianshu.com"]];
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
}




#pragma makr - ReceiveMemoryWarn
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

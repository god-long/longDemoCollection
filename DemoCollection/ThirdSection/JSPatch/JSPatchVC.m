//
//  JSPatchVC.m
//  DemoCollection
//
//  Created by 许龙 on 16/7/28.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "JSPatchVC.h"

@interface JSPatchVC () <UIAlertViewDelegate>

@property (nonatomic, weak  ) IBOutlet UILabel *tipsLabel;

@end

@implementation JSPatchVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"JSPatch";
    
//    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
//    tempView.layer.cornerRadius = 50;
//    tempView.layer.masksToBounds = YES;
//    tempView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:tempView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self crashAction];
}


- (void)crashAction {
    
    UIAlertController *crashAlertVC = [UIAlertController alertControllerWithTitle:@"崩溃提示" message:@"点击确定即将闪退" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"要崩了");
        NSArray *tempArray = [NSArray array];
        NSString *title = [tempArray objectAtIndex:1];
        NSLog(@"%@",title);
    }];
    [crashAlertVC addAction:okAction];
    
    [self presentViewController:crashAlertVC animated:YES completion:nil];
}

#pragma mark UIAlertViewDelegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

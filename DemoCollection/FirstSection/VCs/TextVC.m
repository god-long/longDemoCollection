//
//  TextVC.m
//  DemoCollection
//
//  Created by 许龙 on 2016/10/11.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "TextVC.h"

@interface TextVC () <UITextViewDelegate>

@end

@implementation TextVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTextView];
}


-(void)createTextView {
    //字符串的处理
    NSString *str  =@"@百度是大坏蛋@www.baidu.com";
    NSString *matchStr = @"百度";
    NSMutableAttributedString *MAttributedString = [[NSMutableAttributedString alloc]initWithString:str];
    
    if ([str rangeOfString:matchStr].location!=NSNotFound) {
        /**
         *  注意这个url必须是*****://***的格式不然url取不到字符串
         */
        [MAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"username://"] range:[[MAttributedString string] rangeOfString:matchStr]];
    }
    
    //UITextView的创建
    UITextView *TV = [[UITextView alloc]initWithFrame:CGRectMake(0, 360, 300, 200)];
    TV.backgroundColor = [UIColor grayColor];
    //    设置点击时的样式
    NSDictionary *linkAttributes =@{NSForegroundColorAttributeName: [UIColor greenColor],NSUnderlineColorAttributeName: [UIColor lightGrayColor],NSUnderlineStyleAttributeName:@(NSUnderlinePatternSolid)};
    
    //    添加链接文字
    TV.linkTextAttributes = linkAttributes;
    /** 设置自动检测类型为链接网址. */
    TV.dataDetectorTypes = UIDataDetectorTypeLink;
    TV.delegate = self;
    TV.attributedText = MAttributedString;
    TV.selectable = YES;
    //必须设为NO不然不能响应点击事件
    TV.editable = NO;
    
    [self.view addSubview:TV];
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"%@",URL);
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

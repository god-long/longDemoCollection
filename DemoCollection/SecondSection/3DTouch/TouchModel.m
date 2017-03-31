//
//  TouchModel.m
//  DemoCollection
//
//  Created by 许龙 on 2017/3/1.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import "TouchModel.h"

@implementation TouchModel

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    if (self = [super init]) {
        self.title = title;
        self.subTitle = subTitle;
    }
    return self;
}

@end

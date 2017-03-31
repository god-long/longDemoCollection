//
//  TodayModel.m
//  DemoCollection
//
//  Created by 许龙 on 2017/3/23.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import "TodayModel.h"
#import "MacrosHeaders.h"

@implementation TodayModel

- (instancetype)initTodayModelWith:(NSDictionary *)dic {
    
    if (self = [super init]) {
        self.name = [dic objectForKey:kTodayName];
    }
    return self;
}

@end

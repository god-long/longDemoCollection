//
//  TodayModel.h
//  DemoCollection
//
//  Created by 许龙 on 2017/3/23.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayModel : NSObject

@property (nonatomic, copy  ) NSString *name;

- (instancetype)initTodayModelWith:(NSDictionary *)dic;

@end

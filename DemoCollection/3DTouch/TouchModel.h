//
//  TouchModel.h
//  DemoCollection
//
//  Created by 许龙 on 2017/3/1.
//  Copyright © 2017年 许龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchModel : NSObject

@property (nonatomic, copy  ) NSString *title;

@property (nonatomic, copy  ) NSString *subTitle;

- (instancetype)initWithTitle:(NSString *)title
                     subTitle:(NSString *)subTitle;

@end

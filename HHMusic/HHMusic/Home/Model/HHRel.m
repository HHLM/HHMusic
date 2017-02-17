//
//  HHRel.m
//  HHMusic
//
//  Created by LXH on 2017/1/12.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHRel.h"

@implementation HHRel
//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"uid" : @"id"};
}
@end

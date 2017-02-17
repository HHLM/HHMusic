//
//  HHBaseModel.h
//  HHMusic
//
//  Created by LXH on 2017/1/11.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequest.h"
@interface HHBaseModel : NSObject

@property (nonatomic, copy) NSString *is_show_quick_start;

@property (nonatomic, copy) id song;

@property (nonatomic, copy) NSString *r;


+ (void)getDataParameters:(NSDictionary *)parameters
                      blcok:(void(^)(id data,NSError *error))block;
@end

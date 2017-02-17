//
//  HTTPRequest.h
//  HHMusic
//
//  Created by LXH on 2017/1/11.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPRequest : NSObject

+ (void)getDataParameters:(NSDictionary *)parameters
                     dataBlock:(void(^)(id responseObject,NSError *error))block;

@end

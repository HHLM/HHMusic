//
//  HHBaseModel.m
//  HHMusic
//
//  Created by LXH on 2017/1/11.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHBaseModel.h"

@implementation HHBaseModel

+ (void)getDataParameters:(NSDictionary *)parameters
                      blcok:(void(^)(id data,NSError *error))block;
{
    [HTTPRequest getDataParameters:parameters dataBlock:^(id responseObject, NSError *error) {
        if (!error) {
            HHBaseModel *model = [HHBaseModel yy_modelWithDictionary:responseObject];
            block(model.song,nil);
        }else{
            block(nil,error);
        }
    }];
}
@end

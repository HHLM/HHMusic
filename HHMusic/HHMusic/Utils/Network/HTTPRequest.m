//
//  HTTPRequest.m
//  HHMusic
//
//  Created by LXH on 2017/1/11.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HTTPRequest.h"
#import <AFNetworking.h>

static NSString *kBaseURL = @"http://douban.fm/j/mine/playlist?type=%@&sid=%@&pt=%f&channel=1&from=mainsite";

@implementation HTTPRequest

+ (void)getDataParameters:(NSDictionary *)parameters
                     dataBlock:(void(^)(id responseObject,NSError *error))block
{
    NSString *keyString = [NSString stringWithFormat:kBaseURL,parameters[@"type"],parameters[@"sid"],parameters[@"pt"]];
    
    AFHTTPSessionManager *manger  = [AFHTTPSessionManager manager];
    
    NSSet *set = [NSSet setWithObjects:@"application/json",@"text/json",
                  @"text/javascript",@"text/plan",@"text/html",nil];
    
    manger.responseSerializer.acceptableContentTypes = set;
    
    NSLog(@"音乐地址URL:%@",keyString);
    [manger GET:keyString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@",dic);
        block(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
    
}

@end

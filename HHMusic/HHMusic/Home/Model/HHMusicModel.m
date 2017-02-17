//
//  HHMusicModel.m
//  HHMusic
//
//  Created by LXH on 2017/1/12.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHMusicModel.h"

@implementation HHMusicModel



//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"HSingers" : @"singers",@"rel":@"release"};
}
//
//// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"release" : [HHRel class]};
//}


+ (void)getMusicInfoWithSid:(NSString *)sid
                       type:(NSString *)type
                         pt:(NSString *)pt
                      blcok:(void(^)(id data,NSError *eror))block
{
    NSDictionary *dic = @{@"sid":sid?:@" ",
                          @"type":type?:@" ",
                          @"pt":pt?:@" "};
    [self getDataParameters:dic blcok:^(id data, NSError *error) {
        if (!error) {
            if ([data isKindOfClass:[NSArray class]]) {
                HHMusicModel *model = [HHMusicModel yy_modelWithDictionary:[data firstObject]];
                block(model,nil);
            }else{
                
            }
        }else{
            block(nil,error);
        }
    }];
}



@end

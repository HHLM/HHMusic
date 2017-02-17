//
//  HHMusicModel.h
//  HHMusic
//
//  Created by LXH on 2017/1/12.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHBaseModel.h"
#import "HHRel.h"

@interface HHMusicModel : HHBaseModel


@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *picture;

@property (nonatomic, copy) NSString *url; //音乐地址

@property (nonatomic, copy) NSString *artist;

@property (nonatomic, copy) NSString *length; //时间长度

@property (nonatomic, copy) NSString *link;     //链接

//@property (nonatomic, copy) HHRel  *rel; //歌手头像

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *type; //类型
@property (nonatomic, copy) NSArray *singers; //类型

/**
 
 
 aid = 1898119;
 album = "/subject/1898119/";
 albumtitle = "\U5927\U660e\U661f";
 "alert_msg" = "";
 artist = "\U9648\U5c0f\U6625";
 "file_ext" = mp4;
 "is_royal" = 0;
 kbps = 128;
 length = 288;
 like = 0;
 picture = "https://img3.doubanio.com/lpic/s2838654.jpg";
 "public_time" = 1999;
 release =             {
 id = 1898119;
 link = "https://douban.fm/album/1898119g5832";
 ssid = 5832;
 };
 sha256 = ebd5f25131e54fdbadb956f592b526027cb45b03797b1f0a077eda73ad28818f;
 sid = 191728;
 singers =             (
 {
 avatar = "https://img3.doubanio.com/img/fmadmin/large/31281.jpg";
 genre =                     (
 Pop
 );
 id = 5413;
 "is_site_artist" = 0;
 name = "\U9648\U5c0f\U6625";
 "name_usual" = "\U9648\U5c0f\U6625";
 region =                     (
 "\U9999\U6e2f"
 );
 "related_site_id" = 0;
 style =                     (
 );
 }
 );
 ssid = 5105;
 status = 0;
 subtype = "";
 title = "\U6ca1\U90a3\U79cd\U547d";
 "update_time" = 1470125713;
 url = "http://mr3.doubanio.com/e37e5232c659a3d789c7aba97a37b286/0/fm/song/p191728_128k.mp4";
 
 */

+ (void)getMusicInfoWithSid:(NSString *)sid
                       type:(NSString *)type
                         pt:(NSString *)pt
                      blcok:(void(^)(id data,NSError *eror))block;
@end



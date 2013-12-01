//
//  User.m
//  veboo
//
//  Created by HeQingbao on 13-11-30.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import "User.h"
#import "Status.h"

@implementation User

- (NSDictionary *)attributesMapDictionary
{
    NSDictionary *dictionary = @{@"id": @"userID",
                                 @"idstr": @"userIDStr",
                                 @"screen_name": @"screenName",
                                 @"name": @"name",
                                 @"province": @"province",
                                 @"city": @"city",
                                 @"location": @"location",
                                 @"description": @"description",
                                 @"url": @"url",
                                 @"profile_image_url": @"profile_image_url",
                                 @"profile_url": @"profile_url",
                                 @"domain": @"domain",
                                 @"weihao": @"weihao",
                                 @"gender": @"gender",
                                 @"followers_count": @"followers_count",
                                 @"friends_count": @"friends_count",
                                 @"statuses_count": @"statuses_count",
                                 @"favourites_count": @"favouritesCount",
                                 @"created_at": @"createdAt",
                                 @"allow_all_act_msg": @"allowAllActMsg",
                                 @"geo_enabled": @"geoEnabled",
                                 @"verified": @"verified",
                                 @"remark": @"remark",
                                 @"allow_all_comment": @"allowAllComment",
                                 @"avatar_large": @"avatarLarge",
                                 @"avatar_hd": @"avatarHD",
                                 @"verified_reason": @"verifiedReason",
                                 @"online_status": @"onlineStatus",
                                 @"bi_followers_count": @"biFollowersCount",
                                 @"lang": @"lang"};
    return dictionary;
}

- (void)setAttributes:(NSDictionary *)dictionary
{
    [super setAttributes:dictionary];
    
    NSDictionary *statusDic = [dictionary objectForKey:@"status"];
    if (statusDic) {
        Status *status = [[Status alloc] initWithDataDictionary:statusDic];
        _status = status;
    }
    
}

@end

//
//  Status.m
//  veboo
//
//  Created by HeQingbao on 13-11-30.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import "Status.h"
#import "User.h"

@implementation Status

- (NSDictionary *)attributesMapDictionary
{
    NSDictionary *dictionary = @{@"created_at": @"createAt",
                                 @"id": @"statusID",
                                 @"mid": @"statusMID",
                                 @"idstr": @"statusIDStr",
                                 @"text": @"text",
                                 @"source": @"source",
                                 @"favorited": @"favorited",
                                 @"truncated": @"truncated",
                                 @"thumbnail_pic": @"thumbnailPic",
                                 @"bmiddle_pic": @"bmiddlePic",
                                 @"original_pic": @"originalPic",
                                 @"reposts_count": @"repostsCount",
                                 @"comments_count": @"commentsCount",
                                 @"attitudes_count": @"attitudesCount"};
    return dictionary;
}

- (void)setAttributes:(NSDictionary *)dictionary
{
    [super setAttributes:dictionary];
    
    NSDictionary *userDic = [dictionary objectForKey:@"user"];
    if (userDic) {
        User *user = [[User alloc] initWithDataDictionary:userDic];
        _user = user;
    }
    
    NSDictionary *retweetStatusDic = [dictionary objectForKey:@"retweeted_status"];
    if (retweetStatusDic) {
        Status *retweetStatus = [[Status alloc] initWithDataDictionary:retweetStatusDic];
        _retweetStatus = retweetStatus;
    }
}

@end

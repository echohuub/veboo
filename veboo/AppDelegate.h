//
//  AppDelegate.h
//  veboo
//
//  Created by HeQingbao on 13-11-26.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WEIBO_AUTH_DATA_KEY         @"weiboAuthDataKey"
#define WEIBO_ACCESS_TOKEN_KEY      @"weiboAccessToken"
#define WEIBO_EXPIRATION_DATE_KEY   @"weiboExpirationDate"
#define WEIBO_USER_ID               @"weiboUserID"

@class SinaWeibo;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) SinaWeibo *sinaWeibo;

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UIViewController *mainCtrl;

@end

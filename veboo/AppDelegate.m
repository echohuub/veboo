//
//  AppDelegate.m
//  veboo
//
//  Created by HeQingbao on 13-11-26.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import "AppDelegate.h"
#import "SinaWeibo.h"

#import "MainViewController.h"

@implementation AppDelegate

#pragma mark -
#pragma mark - Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _mainCtrl = [[MainViewController alloc] init];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:_mainCtrl];
    
    self.window.rootViewController = navCtrl;
    
    // release
    [_mainCtrl release];
    [navCtrl release];
    [_window release];
    
    [self initSinaWeibo];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initSinaWeibo
{
    _sinaWeibo = [[SinaWeibo alloc] initWithAppKey:kAppKey appSecret:kAppSecret appRedirectURI:kRedirectURI andDelegate:(id<SinaWeiboDelegate>)_mainCtrl];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *authData = [userDefaults objectForKey:WEIBO_AUTH_DATA_KEY];
    if (authData) {
        _sinaWeibo.accessToken = [authData objectForKey:WEIBO_ACCESS_TOKEN_KEY];
        _sinaWeibo.expirationDate = [authData objectForKey:WEIBO_EXPIRATION_DATE_KEY];
        _sinaWeibo.userID = [authData objectForKey:WEIBO_USER_ID];
    }
}

@end

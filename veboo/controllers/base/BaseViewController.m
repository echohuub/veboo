//
//  BaseViewController.m
//  veboo
//
//  Created by HeQingbao on 13-11-30.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@implementation BaseViewController

- (SinaWeibo *)sinaWeibo
{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    return delegate.sinaWeibo;
}

@end

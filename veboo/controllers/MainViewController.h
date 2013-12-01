//
//  MainViewController.h
//  veboo
//
//  Created by HeQingbao on 13-11-27.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SinaWeibo.h"

@interface MainViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource, SinaWeiboDelegate>
{
    UITableView *_tableView;
}

@property (nonatomic, retain) NSMutableArray *statuses;

@end

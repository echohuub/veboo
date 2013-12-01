//
//  MainViewController.m
//  veboo
//
//  Created by HeQingbao on 13-11-27.
//  Copyright (c) 2013年 Study. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "Status.h"

@implementation MainViewController

#pragma mark - 
#pragma mark - Life cycle
- (void)dealloc
{
    [_tableView release];
    [_statuses release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    loginButton.frame = CGRectMake(0, 0, 50, 35);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *loginBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:loginButton];
    self.navigationItem.rightBarButtonItem = loginBarButtonItem;
    [loginBarButtonItem release];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    if ([[self sinaWeibo] isAuthValid]) {
        loginButton.enabled = NO;
        [self loadHomeTimeLine];
    }
}

#pragma mark -
#pragma mark - Lazy initialization
- (NSMutableArray *)statuses
{
    if (!_statuses) {
        _statuses = [[NSMutableArray alloc] init];
    }
    return _statuses;
}

#pragma mark - 
#pragma mark - Actions
- (void)loginButtonPressed
{
    [[self sinaWeibo] logIn];
}

- (void)loadHomeTimeLine
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"20" forKey:@"count"];
    [[self sinaWeibo] requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" block:^(id result) {
        NSArray *statuses = [result objectForKey:@"statuses"];
        for (NSDictionary *dic in statuses) {
            Status *status = [[Status alloc] initWithDataDictionary:dic];
            [_statuses addObject:status];
            [status release];
        }
        [_tableView reloadData];
    }];
}

#pragma mark - 
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self statuses] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Status *status = [_statuses objectAtIndex:indexPath.row];
    cell.textLabel.text = status.text;
    return cell;
}

#pragma mark - 
#pragma mark - SinaWeiboDelegate
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSDictionary *weiboAuthData = [NSDictionary dictionaryWithObjectsAndKeys:sinaweibo.accessToken, WEIBO_ACCESS_TOKEN_KEY, sinaweibo.expirationDate, WEIBO_EXPIRATION_DATE_KEY, sinaweibo.userID, WEIBO_USER_ID, nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:weiboAuthData forKey:WEIBO_AUTH_DATA_KEY];
    [userDefaults synchronize];
}

- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:WEIBO_AUTH_DATA_KEY];
    [userDefaults synchronize];
}

- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo
{
    
}

- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error
{
    
}

- (void)sinaweibo:(SinaWeibo *)sinaweibo accessTokenInvalidOrExpired:(NSError *)error
{
    
}

@end

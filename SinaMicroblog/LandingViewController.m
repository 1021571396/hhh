//
//  LandingViewController.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    //登陆界面
    LandingView*view=[[LandingView alloc]initWithFrame:self.view.frame];
    self.view=view;
    [view.landingBtn addTarget:self action:@selector(gotoLandWeibo) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)gotoLandWeibo
{
    NSLog(@"gogogogo");
    //SSO 微博客户端授权认证
    //调用 SendRequest 的方法后会跳转到微博程序。如果当前微博客户端没有账号,则进入登 录界面;如果当前微博客户端已经有账户,则进入账户管理界面,选择要向第三方授权的账 户。当授权完成后会回调给第三方应用程序,第三方实现 WeiboSDKDelegate 的 didReceiveWeiboResponse 方式监听此次请求的 response.
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gotoTabBarVC) name:@"gotoTabBarVC" object:nil];
}

-(void)gotoTabBarVC
{
    UIAlertView*alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"登陆成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    TabBarViewController*tabVC=[[TabBarViewController alloc]init];
    [self presentViewController:tabVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

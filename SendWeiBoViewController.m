//
//  SendWeiBoViewController.m
//  SinaMicroblog
//
//  Created by iGenMO on 14/10/19.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import "SendWeiBoViewController.h"

@interface SendWeiBoViewController ()

@end

@implementation SendWeiBoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationController*navigationController=[[UINavigationController alloc]initWithRootViewController:[[UIViewController alloc]init]];
    navigationController.view.frame=CGRectMake(0, 24, SCREEN_W, SCREEN_H);
    [self.view addSubview:navigationController.view];
    navigationController.view.backgroundColor=[UIColor whiteColor];
#pragma mark 自定义底部栏
    UIView*buttomView=[[UIView alloc]initWithFrame:CGRectMake(0,SCREEN_H-45, SCREEN_W, 45)];
    buttomView.backgroundColor=[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    [self.view addSubview:buttomView];
    
#pragma mark 自定义导航栏按钮
    //左边取消按钮
    UIButton*cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame=CGRectMake(10, 13, 40, 20);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [cancelBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*cancelItem=[[UIBarButtonItem alloc]initWithCustomView:cancelBtn];
    self.navigationItem.leftBarButtonItem=cancelItem;
    [navigationController.view addSubview:cancelBtn];
    //右边发送按钮
    UIButton*sendBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    sendBtn.frame=CGRectMake(270, 13, 40, 20);
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    sendBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [sendBtn setTitleColor:[UIColor colorWithRed:207/255.0 green:207/255.0 blue:207/255.0 alpha:1] forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*sendItem=[[UIBarButtonItem alloc]initWithCustomView:sendBtn];
    self.navigationItem.rightBarButtonItem=sendItem;
    [navigationController.view addSubview:sendBtn];
    
}
#pragma mark 取消按钮方法
-(void)cancelAction{
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(slowToClose) userInfo:nil repeats:NO];
    
}
-(void)slowToClose{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 发送按钮方法---(未写)
-(void)sendAction{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  AddViewController.m
//  SinaMicroblog
//
//  Created by iGenMO on 14/10/18.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import "AddViewController.h"
#define UnderY self.view.frame.size.height-49+5
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建UIScrollView
    UIScrollView*scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREEN_H/2-130, 320, 300)];
    scrollview.directionalLockEnabled=YES;//单方向滑动
    scrollview.showsHorizontalScrollIndicator=NO;//隐藏水平滑动滚动条
    scrollview.showsVerticalScrollIndicator=NO;//隐藏垂直滑动滚动条
    scrollview.backgroundColor=[UIColor grayColor];
    scrollview.contentSize=CGSizeMake(640, 300);
    scrollview.pagingEnabled=YES;
    scrollview.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    [self.view addSubview:scrollview];
    
    //设置底部关闭按钮
    UIButton*closeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage redrawImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)] forState:UIControlStateNormal];
//    closeButton.frame =
    closeButton.frame=CGRectMake((320-320/5)/2,UnderY, 320/5, 49);
    [closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
    //打开关闭按钮动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    closeButton.transform=CGAffineTransformMakeRotation(M_PI);
    
}
#pragma mark 关闭按钮
-(void)closeAction:(id)sender
{
    for (int i=0; i<6; i++) {
        UIButton*btn=(UIButton*)[self.view viewWithTag:2001+i];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        btn.transform=CGAffineTransformMakeTranslation(0, 0);
        btn.transform=CGAffineTransformMakeTranslation(0, 500);
        [UIView commitAnimations];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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

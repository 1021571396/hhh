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
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    //创建底部背景色
//    self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    self.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.98];
    UIView *buttomView = [[UIView alloc]initWithFrame:CGRectMake(0, UnderY, 320, 49)];
    buttomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:buttomView];
    //创建UIScrollView
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREEN_H/2-80, 320, 300)];
    scrollview.directionalLockEnabled=YES;//单方向滑动
    scrollview.showsHorizontalScrollIndicator=NO;//隐藏水平滑动滚动条
    scrollview.showsVerticalScrollIndicator=NO;//隐藏垂直滑动滚动条
//    scrollview.backgroundColor=[UIColor grayColor];
    scrollview.contentSize=CGSizeMake(640, 300);
    scrollview.pagingEnabled=YES;//整页翻动
    scrollview.delegate=self;
    scrollview.bounces=NO;//边界不反弹
    scrollview.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    [self.view addSubview:scrollview];
    
    //设置底部关闭按钮
    closeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setImage:[UIImage redrawImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)] forState:UIControlStateNormal];
    closeButton.frame=CGRectMake((320-320/5)/2,UnderY, 320/5, 49);
    [closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
    closeButton.tag=2020;
//    打开关闭按钮动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    closeButton.transform=CGAffineTransformMakeRotation(M_PI/2);
    [UIView commitAnimations];
    //设置第二页底部按钮
    //返回按钮
    backBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame=CGRectMake(0, SCREEN_H-49+5, SCREEN_W/2, 44);
    [backBtn setImage:[UIImage redrawImage:[UIImage imageNamed:@"tabbar_compose_background_icon_return@2x"] withFrame:CGRectMake(0, 0, 30, 30)] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    closeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage redrawImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)] forState:UIControlStateNormal];
    closeBtn.frame=CGRectMake(SCREEN_W/2,UnderY, SCREEN_W/2, 49);
    [closeBtn addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    closeBtn.hidden=YES;
    backBtn.hidden=YES;
    //六个按钮
    NSArray*buttonTitles=[NSArray arrayWithObjects:@"文字",@"相册",@"拍摄",@"签到",@"点评",@"更多", @"好友圈",@"有声照片",@"秒拍",@"定时删",@"长微博",@"收款",nil];
    NSArray*buttonIamges=[NSArray arrayWithObjects:[UIImage imageNamed:@"tabbar_compose_idea@2x.png"],
                          [UIImage imageNamed:@"tabbar_compose_photo@2x.png"],
                          [UIImage imageNamed:@"tabbar_compose_camera@2x.png"],
                          [UIImage imageNamed:@"tabbar_compose_lbs@2x.png"],
                          [UIImage imageNamed:@"tabbar_compose_review@2x.png"],
                          [UIImage imageNamed:@"tabbar_compose_more@2x.png"],
                          [UIImage imageNamed:@"tabbar_compose_friend@2x"],
                          [UIImage imageNamed:@"tabbar_compose_voice@2x"],
                          [UIImage imageNamed:@"tabbar_compose_shooting@2x"],
                          [UIImage imageNamed:@"tabbar_compose_delete@2x"],
                          [UIImage imageNamed:@"tabbar_compose_weibo@2x"],
                          [UIImage imageNamed:@"tabbar_compose_envelope@2x"],
                          nil];
    for (int i=0; i<12; i++)
    {
        UILabel*lab=[[UILabel alloc]init];
        lab.text=[buttonTitles objectAtIndex:i];
        lab.frame=CGRectMake(0, 65, 60, 20);
        [lab setFont:[UIFont fontWithName:nil size:14]];
        lab.textAlignment=NSTextAlignmentCenter;
        UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=2001+i;
        [btn setImage:[UIImage redrawImage:[buttonIamges objectAtIndex:i] withFrame:CGRectMake(0, 0, 60, 60)] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonInTabBarAddButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i<3) {
            btn.frame=CGRectMake(40+90*i, 40, 60, 60);
        }
        if(i>=3&&i<6)
        {
            btn.frame=CGRectMake(40+90*(i-3), 140, 60, 60);
        }
        if (i>=6&&i<9) {
            btn.frame=CGRectMake(360+90*(i-6), 40, 60, 60);
        }
        if (i>=9&&i<12) {
            btn.frame=CGRectMake(360+90*(i-9), 140, 60, 60);
        }
        
//        //按钮动画
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.5];
//        [UIView setAnimationDelegate:self];
//        btn.transform=CGAffineTransformMakeTranslation(0, -500);
//        btn.transform=CGAffineTransformMakeTranslation(0, 0);
//        [UIView commitAnimations];
        
        [self animation:btn];
        [btn addSubview:lab];
        [scrollview addSubview:btn];
    }
    //利用uiview完成按钮出现动画效果
//    for (int i = 0; i<6; i++) {
//        UIButton*btn=(UIButton*)[self.view viewWithTag:2001+i];
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.5+i*0.2];
//        [UIView setAnimationDelegate:self];
//        btn.transform=CGAffineTransformMakeTranslation(0, 600);
//        btn.transform=CGAffineTransformMakeTranslation(0, 0);
//        [UIView commitAnimations];
//    }
//    for (int i = 0; i<6; i++) {
//        UIButton*btn=(UIButton*)[self.view viewWithTag:2007+i];
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDuration:0.5+i*0.2];
//        [UIView setAnimationDelegate:self];
//        btn.transform=CGAffineTransformMakeTranslation(0, 600);
//        btn.transform=CGAffineTransformMakeTranslation(0, 0);
//        [UIView commitAnimations];
//    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollview.contentOffset.x==320){
        closeButton.hidden=YES;
        closeBtn.hidden=NO;
        backBtn.hidden=NO;
    }
    else{
        closeBtn.hidden=YES;
        backBtn.hidden=YES;
        closeButton.hidden=NO;
    }
}

-(void)back{
    [UIView animateWithDuration:0.3 animations:^{
        [scrollview setContentOffset:CGPointMake(0, 0)];
    }];
    closeBtn.hidden=YES;
    backBtn.hidden=YES;
    closeButton.hidden=NO;
}



#pragma mark 按钮动作
-(void)buttonInTabBarAddButtonClickedAction:(id)sender{
    UIButton*btn=(UIButton*)sender;
    switch (btn.tag) {
        case 2001:
            
            break;
        case 2002:
            NSLog(@"1");
            break;
        case 2003:
            NSLog(@"1");
            break;
        case 2004:
            NSLog(@"1");
            break;
        case 2005:
            NSLog(@"1");
            break;
        case 2006:
        {
            [UIView animateWithDuration:0.3 animations:^{
              [scrollview setContentOffset:CGPointMake(320, 0)];
            }];
           
            closeButton.hidden=YES;
            closeBtn.hidden=NO;
            backBtn.hidden=NO;
        }
            break;
        case 2007:
            NSLog(@"1");
            break;
        case 2008:
            NSLog(@"1");
            break;
        case 2009:
            NSLog(@"1");
            break;
        case 2010:
            NSLog(@"1");
            break;
        case 2011:
            NSLog(@"1");
            break;
        case 2012:
            NSLog(@"1");
            break;
            
        default:
            break;
    }
    
}
#pragma mark 按钮动画
-(void)animation:(UIButton*)btn{
    switch (btn.tag) {
        case 2001:
        {
            CAKeyframeAnimation*positionAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSArray*positionValues=[[NSArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(70, SCREEN_H-50)], [NSValue valueWithCGPoint:CGPointMake(70,45)],[NSValue valueWithCGPoint:CGPointMake(70, 70)],nil];
            positionAnimation.values=positionValues;//指数组
            [positionAnimation setDuration:0.3];
            [btn.layer addAnimation:positionAnimation forKey:@"关键帧动画"];
        }
            break;
        case 2002:
        {
            CAKeyframeAnimation*positionAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSArray*positionValues=[[NSArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2001), SCREEN_H+150)], [NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2001),45)],[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2001), 70)],nil];
            positionAnimation.values=positionValues;//指数组
            [positionAnimation setDuration:0.4];
            [btn.layer addAnimation:positionAnimation forKey:@"关键帧动画"];
        }
            break;
        case 2003:
        {
            CAKeyframeAnimation*positionAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSArray*positionValues=[[NSArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2001), SCREEN_H+400)], [NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2001),45)],[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2001), 70)],nil];
            positionAnimation.values=positionValues;//指数组
            [positionAnimation setDuration:0.5];
            [btn.layer addAnimation:positionAnimation forKey:@"关键帧动画"];
        }
            break;
        case 2004:
        {
            CAKeyframeAnimation*positionAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSArray*positionValues=[[NSArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004), SCREEN_H+150)], [NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004),145)],[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004), 170)],nil];
            positionAnimation.values=positionValues;//指数组
            [positionAnimation setDuration:0.4];
            [btn.layer addAnimation:positionAnimation forKey:@"关键帧动画"];
        }
            break;
        case 2005:
        {
            CAKeyframeAnimation*positionAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSArray*positionValues=[[NSArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004), SCREEN_H+400)], [NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004),145)],[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004), 170)],nil];
            positionAnimation.values=positionValues;//指数组
            [positionAnimation setDuration:0.5];
            [btn.layer addAnimation:positionAnimation forKey:@"关键帧动画"];
        }
            break;
        case 2006:
        {
            CAKeyframeAnimation*positionAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
            NSArray*positionValues=[[NSArray alloc]initWithObjects:[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004), SCREEN_H+400)], [NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004),145)],[NSValue valueWithCGPoint:CGPointMake(70+90*(btn.tag-2004), 170)],nil];
            positionAnimation.values=positionValues;//指数组
            [positionAnimation setDuration:0.6];
            [btn.layer addAnimation:positionAnimation forKey:@"关键帧动画"];
        }
            break;
        default:
            break;
    }

}
#pragma mark 关闭按钮
-(void)closeAction:(id)sender
{
    for (int i = 0; i<6; i++) {
        UIButton*btn=(UIButton*)[self.view viewWithTag:2001+i];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5-i*0.25];
        [UIView setAnimationDelegate:self];
        btn.transform=CGAffineTransformMakeTranslation(0, 40);
        btn.transform=CGAffineTransformMakeTranslation(0, 700);
        [UIView commitAnimations];
    }
    for (int i = 0; i<6; i++) {
        UIButton*btn=(UIButton*)[self.view viewWithTag:2007+i];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5-i*0.25];
        [UIView setAnimationDelegate:self];
        btn.transform=CGAffineTransformMakeTranslation(0, 40);
        btn.transform=CGAffineTransformMakeTranslation(0, 700);
        [UIView commitAnimations];
    }
    UIButton*btn=(UIButton*)sender;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    btn.transform=CGAffineTransformMakeRotation(M_PI+M_PI/2+M_PI/4);
    [UIView commitAnimations];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(slowToClose) userInfo:nil repeats:YES];
    
}
-(void)slowToClose{
    [self dismissViewControllerAnimated:NO completion:nil];
}
#pragma mark文字按钮
-(void)worksAction{
//    UIButton*btn=(UIButton*)[self.view viewWithTag:2001];
    
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

//
//  AddView.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "AddView.h"
#define UnderY self.frame.size.height-49+5
@implementation AddView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:0.99];
        UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, UnderY, 320, 49)];
        subView.backgroundColor = [UIColor whiteColor];
        [self addSubview:subView];
        
        //关闭按钮
        UIButton*closeButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [closeButton setImage:[UIImage redrawImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)] forState:UIControlStateNormal];
        closeButton.frame = CGRectMake((320-320/5)/2, UnderY, 320/5, 49);
        [closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeButton];
        
        //打开关闭按钮动画
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        closeButton.transform=CGAffineTransformMakeRotation(M_PI);
        [UIView commitAnimations];
        
        //六个按钮
        NSArray*buttonTitles=[NSArray arrayWithObjects:@"文字",@"相册",@"拍摄",@"签到",@"点评",@"更多", nil];
        NSArray*buttonIamges=[NSArray arrayWithObjects:[UIImage imageNamed:@"tabbar_compose_idea@2x.png"],
                              [UIImage imageNamed:@"tabbar_compose_photo@2x.png"],
                              [UIImage imageNamed:@"tabbar_compose_camera@2x.png"],
                              [UIImage imageNamed:@"tabbar_compose_lbs@2x.png"],
                              [UIImage imageNamed:@"tabbar_compose_review@2x.png"],
                              [UIImage imageNamed:@"tabbar_compose_more@2x.png"], nil];
        for (int i=0; i<6; i++)
        {
            UILabel*lab=[[UILabel alloc]init];
            lab.text=[buttonTitles objectAtIndex:i];
            lab.frame=CGRectMake(13, 65, 40, 20);
            [lab setFont:[UIFont fontWithName:nil size:16]];
            UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag=2001+i;
            [btn setImage:[UIImage redrawImage:[buttonIamges objectAtIndex:i] withFrame:CGRectMake(0, 0, 60, 60)] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonInTabBarAddButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
            if (i<3) {
                btn.frame=CGRectMake(40+90*i, [UIScreen mainScreen].bounds.size.height/2-100, 60, 60);
            }else
            {
                btn.frame=CGRectMake(40+90*(i-3), [UIScreen mainScreen].bounds.size.height/2, 60, 60);
            }
            [btn addSubview:lab];
            [self addSubview:btn];
            //按钮动画
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.5];
            [UIView setAnimationDelegate:self];
            btn.transform=CGAffineTransformMakeTranslation(0, 500);
            btn.transform=CGAffineTransformMakeTranslation(0, 0);
            [UIView commitAnimations];
        }
    }
    return self;
}

#pragma mark 关闭
-(void)closeAction:(id)sender
{
    for (int i=0; i<6; i++) {
        UIButton*btn=(UIButton*)[self viewWithTag:2001+i];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        btn.transform=CGAffineTransformMakeTranslation(0, 0);
        btn.transform=CGAffineTransformMakeTranslation(0, 500);
        [UIView commitAnimations];
    }
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(removeAddViewAction:) userInfo:nil repeats:NO];
    
}

//移除+按钮的视图
-(void)removeAddViewAction:(id)sender
{
    UIView*backGroundView=(UIView*)[self viewWithTag:1050];
    [backGroundView removeFromSuperview];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeaddview" object:nil];
}
@end

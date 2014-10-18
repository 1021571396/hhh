//
//  LandingView.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "LandingView.h"

@implementation LandingView
@synthesize landingBtn;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //用户名
        UILabel*userNameLable=[[UILabel alloc]initWithFrame:CGRectMake(20, 90, 70, 30)];
        userNameLable.backgroundColor=[UIColor clearColor];
        userNameLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
        userNameLable.text=@"用户名:";
        userNameLable.textColor=[UIColor blackColor];
        [self addSubview:userNameLable];
        
        
        //用户名输入
        UITextField*userNameTextField=[[UITextField alloc]initWithFrame:CGRectMake(90, 90, 210, 30)];
        [userNameTextField setBorderStyle:UITextBorderStyleRoundedRect];
        userNameTextField.placeholder=@"327635328@qq.com";//默认显示字
        userNameTextField.clearButtonMode=UITextFieldViewModeWhileEditing;//编辑时出现X
        userNameTextField.autocapitalizationType=UITextAutocapitalizationTypeNone;//不自动大写
        userNameTextField.keyboardType=UIKeyboardAppearanceDefault;
        userNameTextField.contentVerticalAlignment=UIControlContentHorizontalAlignmentCenter;//设置居中输入
        userNameTextField.autoresizingMask=UIViewAutoresizingFlexibleHeight;
        [self addSubview:userNameTextField];
        
        //用户密码
        UILabel*userPasswordLable=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 70, 30)];
        userPasswordLable.backgroundColor=[UIColor clearColor];
        userPasswordLable.text=@"密    码:";
        userPasswordLable.font=[UIFont fontWithName:@"Helvetica-Bold" size:18];
        userPasswordLable.textColor=[UIColor blackColor];
        [self addSubview:userPasswordLable];
        
        //用户密码输入
        UITextField*userPasswordTextField=[[UITextField alloc]initWithFrame:CGRectMake(90, 130, 210, 30)];
        [userPasswordTextField setBorderStyle:UITextBorderStyleRoundedRect];
        userPasswordTextField.placeholder=@"*************";
        userPasswordTextField.secureTextEntry=YES;//密码类型
        userPasswordTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
        [self addSubview:userPasswordTextField];
        
        //登陆按钮
        landingBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        landingBtn.frame=CGRectMake(20, 200, 280, 30);
        landingBtn.backgroundColor=[UIColor orangeColor];
        [landingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [landingBtn setTitle:@"登录" forState:UIControlStateNormal];
        [self addSubview:landingBtn];
    }
    return self;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

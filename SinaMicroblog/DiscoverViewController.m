//
//  DiscoverViewController.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()
{
    UISearchBar*aSearchBar;
}
@end

@implementation DiscoverViewController

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
    //创建搜索栏
    [self createSearchBar];
    //获取搜索栏的取消按钮
    for (id aa in [aSearchBar subviews]) {
        for (id bb in [aa subviews]) {
            if ([bb isKindOfClass:[UIButton class]]) {
                UIButton*cancer=(UIButton*)bb;
                cancer.frame=CGRectMake(0, 0, 15, 44);
//                [cancer setImage:[UIImage imageNamed:@"message_voice_background@2x"] forState:UIControlStateNormal];
                
                
                
            }
            if ([bb isKindOfClass:[UITextField class]]) {
                UITextField*aTextField=(UITextField *)bb;
                aTextField.frame=CGRectMake(0, 0, SCREEN_W, 44);
            }
        }
    }
    
    
}
-(void)createSearchBar{
    aSearchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W-40, 44)];
    aSearchBar.delegate=self;
    aSearchBar.showsCancelButton=NO;
    UIButton*voice=[[UIButton alloc]initWithFrame:CGRectMake(aSearchBar.frame.size.width-30, 0, 30, 44)];
    [voice setImage:[UIImage imageNamed:@"message_voice_background@2x"] forState:UIControlStateNormal];
    [aSearchBar addSubview:voice];
    UIBarButtonItem*left=[[UIBarButtonItem alloc]initWithCustomView:aSearchBar];
    UIBarButtonItem*flexible=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(lefts)];
    self.navigationItem.leftBarButtonItems=[NSArray arrayWithObjects:left,flexible, nil];
}
-(void)lefts{
    
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

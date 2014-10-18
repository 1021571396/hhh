//
//  TabBarViewController.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "TabBarViewController.h"

#import "TabBarView.h"

@interface TabBarViewController ()
{
    TabBarView*tabBarView;//自定义tabbar
    NSMutableArray *unselectImageArray;//没选中的图片数组
    NSMutableArray *selectImageArray;//选中的图片数组
}
@end

@implementation TabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //系统tabbar隐藏
        [self.tabBar setHidden:YES];
        //tabBarview里会触发方法的按钮
        tabBarView=[[TabBarView alloc]init];
        for (int i=0; i<4; i++) {
            UIButton*btn=[tabBarView.buttonArray_tabbar objectAtIndex:i];
            btn.tag=1001+i;
            [btn addTarget:self action:@selector(selectTabBarItem:) forControlEvents:UIControlEventTouchUpInside];
            UITabBarItem *tabBarItem = [self.tabBar.items objectAtIndex:i];
            UIImage *image = tabBarItem.image;
            [btn setImage:image forState:UIControlStateNormal];
        }
        //+按钮
        UIButton*button=(UIButton*)[tabBarView viewWithTag:tabBarView.buttontag];
        [button addTarget:self action:@selector(addClickedAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tabBarView];
        
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    //未选中数组
    unselectImageArray = [[NSMutableArray alloc]initWithObjects:
                          [UIImage redrawImage:[UIImage imageNamed:@"tabbar_home@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                          [UIImage redrawImage:[UIImage imageNamed:@"tabbar_message_center@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                          [UIImage redrawImage:[UIImage imageNamed:@"tabbar_discover@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                          [UIImage redrawImage:[UIImage imageNamed:@"tabbar_profile@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                          nil];
    //选中数组
    selectImageArray = [[NSMutableArray alloc]initWithObjects:
                        [UIImage redrawImage:[UIImage imageNamed:@"tabbar_home_selected@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                        [UIImage redrawImage:[UIImage imageNamed:@"tabbar_message_center_selected@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                        [UIImage redrawImage:[UIImage imageNamed:@"tabbar_discover_selected@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                        [UIImage redrawImage:[UIImage imageNamed:@"tabbar_profile_selected@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)],
                        nil];
    
    //视图控制器
    HomeViewController*homeVC=[[HomeViewController alloc]init];
    UINavigationController*nav_home=[[UINavigationController alloc]initWithRootViewController:homeVC];
    homeVC.title=@"首页";
    homeVC.tabBarItem.image=[selectImageArray objectAtIndex:0];
    
    MessageViewController*messageVC=[[MessageViewController alloc]init];
    UINavigationController*nav_message=[[UINavigationController alloc]initWithRootViewController:messageVC];
    messageVC.title=@"消息";
    messageVC.tabBarItem.image=[unselectImageArray objectAtIndex:1];
    
    DiscoverViewController*discoverVC=[[DiscoverViewController alloc]init];
    UINavigationController*nav_dis=[[UINavigationController alloc]initWithRootViewController:discoverVC];
    discoverVC.title=@"发现";
    discoverVC.tabBarItem.image=[unselectImageArray objectAtIndex:2];
    
    MyselfViewController*myselfVC=[[MyselfViewController alloc]init];
    UINavigationController*nav_myslef=[[UINavigationController alloc]initWithRootViewController:myselfVC];
    myselfVC.title=@"我";
    myselfVC.tabBarItem.image=[unselectImageArray objectAtIndex:3];
    
    
    self.viewControllers=[NSArray arrayWithObjects:nav_home,nav_message,nav_dis,nav_myslef, nil];
    
    
    
}


#pragma mark - 点击UITabBarItem的变换颜色
-(void)selectTabBarItem:(UIButton*)button
{
    NSLog(@"%lu",(unsigned long)self.selectedIndex);
    unsigned long int tempIndex=self.selectedIndex;
    UIButton*btn=[tabBarView.buttonArray_tabbar objectAtIndex:tempIndex];
    UIImage*image1=[unselectImageArray objectAtIndex:tempIndex];
    [btn setImage:image1 forState:UIControlStateNormal];
    
    //选中变颜色
    UIImage*image2=[selectImageArray objectAtIndex:button.tag-1001];
    [button setImage:image2 forState:UIControlStateNormal];
    self.selectedIndex=button.tag-1001;
}

//点击+按钮
-(void)addClickedAction
{
    AddView*addview=[[AddView alloc]init];
    addview.tag=400;
    [self.view addSubview:addview];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removeaddview:) name:@"removeaddview" object:nil];
}
//监听到通知关闭+中视图
-(void)removeaddview:(id*)sender
{
    UIView*view=(UIView*)[self.view viewWithTag:400];
    [view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

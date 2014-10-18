//
//  HomeViewController.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
{
    UITableView*tableView_home;//首页的表视图
    NSMutableArray*arr_friendNames;//好友名字
    NSMutableArray*arr_friendContents;//好友发布的微博内容
    NSDictionary*dict_request_result;//json解析后字典
}
@end

@implementation HomeViewController

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
    NSLog(@"测试");
    
    
    //首页的表视图
    tableView_home=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView_home.delegate=self;
    tableView_home.dataSource=self;
    tableView_home.rowHeight=400;
    [self.view addSubview:tableView_home];
    
    //拿到plist的token值
    NSString*plistPath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingPathComponent:@"token.plist"];
    NSDictionary*dict_plistPath=[[NSDictionary alloc]initWithContentsOfFile:plistPath];
    NSString*token_str=[dict_plistPath objectForKey:@"token"];
    
    
    
    //网络请求
    NSString*str=@"https://api.weibo.com/2/statuses/friends_timeline.json";
    NSDictionary*dict_home=[[NSDictionary alloc]initWithObjectsAndKeys:@"20",@"count", nil];
    [WBHttpRequest requestWithAccessToken:token_str url:str httpMethod:@"GET" params:dict_home delegate:self withTag:nil];
    
    
}
//完成请求
- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
    dict_request_result=[result objectFromJSONString];
    NSLog(@"%@",dict_request_result);
    arr_friendContents=[[NSMutableArray alloc]init];
    arr_friendNames=[[NSMutableArray alloc]init];
    //请求图片
    for (int i=0; i<20; i++)
    {
        
        //请求好友微博内容
        NSString*statuses_text=[[[dict_request_result objectForKey:@"statuses"] objectAtIndex:i] objectForKey:@"text"];
        [arr_friendContents addObject:statuses_text];
        //请求好友名字
        NSString*statuses_name=[[[[dict_request_result objectForKey:@"statuses"] objectAtIndex:i] objectForKey:@"user"] objectForKey:@"name"];
        [arr_friendNames addObject:statuses_name];
    }
    [tableView_home reloadData];
    
    
    
    
    
    
}



//区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arr_friendNames count];
    //    return 10;
}
//区高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
//tableviewCell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString*identifier=@"CELL";
    HomeTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell=[[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        //用户发布的微博信息的lable
        UILabel*lable=[[UILabel alloc]init];
        lable.tag=100;
        
    }
    cell.lableName.text=[arr_friendNames objectAtIndex:indexPath.section];
    //用SDWebimage请求头像
    NSURL* url=[NSURL URLWithString:[[[[dict_request_result objectForKey:@"statuses"] objectAtIndex:indexPath.section] objectForKey:@"user"] objectForKey:@"profile_image_url"]];
    [cell.userImageView setImageWithURL:url];
    cell.lableTime.text=@"32分钟前";
    cell.lableMessageFrom.text=@"来自:微博 weibo.com";
    
    //用户发布的微博信息自适应高度
    cell.lable_userContent.text=[arr_friendContents objectAtIndex:indexPath.section];
    cell.lable_userContent.numberOfLines=0;
    UIFont*font=[UIFont systemFontOfSize:15];
    CGSize size=[cell.lable_userContent.text boundingRectWithSize:CGSizeMake(310, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    cell.lable_userContent.frame=CGRectMake(5, 50, 310, size.height);
    UILabel*lable=(UILabel*)[cell viewWithTag:100];
    lable.frame=CGRectMake(5, 45, 310, size.height);
    lable.text=cell.lable_userContent.text;
    
    
    //    cell.userContentImage.image=[UIImage imageNamed:@"tabbar_compose_button_highlighted@2x.png"];
    //    cell.userContentImage.frame=CGRectMake(5, CGRectGetMaxY(cell.lable_userContent.frame)+5, 50, 60);
    
    
    
    
    //    CGRectGetMaxY(cell.frame);
    //    NSLog(@"%f",CGRectGetMaxY(cell.lable_userContent.frame));
    //    NSLog(@"%f",CGRectGetMaxY(cell.userImageView.frame));
    
    
    return cell;
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

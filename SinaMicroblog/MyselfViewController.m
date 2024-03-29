//
//  MyselfViewController.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "MyselfViewController.h"
#import "UIImage+Redraw.h"
#import "UIImageView+WebCache.h"
#import "QQmyTableViewCell.h"


@interface MyselfViewController ()
{
    NSArray*iconArr;//图片数组
    NSArray*titleArr;//title数组
    UITableView*aTableView;
    NSString*pictURL;
    NSString*name;
    NSDictionary*dictJson;
}
@end

@implementation MyselfViewController

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
    self.automaticallyAdjustsScrollViewInsets=NO;
  iconArr=@[@[],@[@"findfriend_icon_popolarroots@2x",@"findfriend_icon_guess@2x"],@[@"more_friendscircle_highlighted@2x",@"composer_rating_icon_highlighted@2x",@"noticelist_invite_praise@2x"],@[@"contacts_findfriends_icon@2x",@"contact_miyou_icon@2x"],@[@"findfriend_icon_search@2x",@"more_icon_channelmanage@2x"]];
    
    titleArr=@[@[],@[@"我的好友",@"完善资料"],@[@"我的相册",@"我的收藏",@"赞"],@[@"微博支付",@"个性化"],@[@"我的名片",@"草稿纸"]];
    //拿到token和uid
    NSString*token=[[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    NSString*uid=[[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    NSLog(@"tokens==%@,uid==%@",token,uid);
    NSString*user=@"https://api.weibo.com/2/users/show.json";
    NSDictionary*params=[NSDictionary dictionaryWithObjectsAndKeys:uid,@"uid", nil];
    [WBHttpRequest requestWithAccessToken:token url:user httpMethod:@"GET" params:params delegate:self withTag:@"1002"];
    
    //创建tableView--获取数据后才生成tableview
    [self creatTableView];
    
    //设置按钮
    UIBarButtonItem*right=[[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(rights)];
    self.navigationItem.rightBarButtonItem=right;
    
    
}
-(void)rights{
    NSLog(@"right");
}
//创建tableView
-(void)creatTableView{
    
    aTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64,SCREEN_W, SCREEN_H-64-49) style:UITableViewStyleGrouped];
    [self.view addSubview:aTableView];
    aTableView.delegate=self;
    aTableView.dataSource=self;
    
    
    
}

-(void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result{
    NSLog(@"resultssss");
    dictJson=[result objectFromJSONString];
    
    [aTableView reloadData];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00000001;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==2) {
        return 3;
    }
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier=@"CELL";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    pictURL=[dictJson objectForKey:@"profile_image_url"];
        name=[dictJson objectForKey:@"screen_name"];
        NSString*weibos=[NSString stringWithFormat:@"%@",[dictJson objectForKey:@"statuses_count"]];
        NSString*attentions=[NSString stringWithFormat:@"%@",[dictJson objectForKey:@"friends_count"]];
        NSString*friends=[NSString stringWithFormat:@"%@",[dictJson objectForKey:@"followers_count"]];
        NSLog(@"weibos==%@,attentions=%@,friends=%@",weibos,attentions,friends);
        NSString*collects=[NSString stringWithFormat:@"%@",[dictJson objectForKey:@"favourites_count"]];
        NSString*myDescription=[dictJson objectForKey:@"description"];
        NSLog(@"pictUrl=%@",pictURL);
        NSLog(@"name=%@",name);
    
    if (indexPath.section==0) {
       
        
        if (indexPath.row==0) {
            //获取头像
            [cell.imageView setImageWithURL:[NSURL URLWithString:pictURL]placeholderImage:[UIImage redrawImage:[UIImage imageNamed:@"card_icon_arrow@2x"] withFrame:CGRectMake(0, 0, 50, 50)]];
            
            //用户名字
            cell.textLabel.text=name;
            //用户个性签名
            cell.detailTextLabel.text=[NSString stringWithFormat:@"简介：%@",myDescription];
            cell.detailTextLabel.textColor=[UIColor grayColor];
            
            
        }else{
            
            NSString*idetifiers=@"TWO";
            
            QQmyTableViewCell*cells=[[QQmyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifiers];
            [cells.btn1 setTitle:@"微博" forState:UIControlStateNormal];
            [cells.btn2 setTitle:@"关注" forState:UIControlStateNormal];
            [cells.btn3 setTitle:@"粉丝" forState:UIControlStateNormal];
            
            cells.label1.text=weibos;
            cells.label2.text=attentions;
            cells.label3.text=friends;
            return cells;
            
        }
        
        
        
        
    }
    if (indexPath.section>0) {
        cell.imageView.image=[UIImage imageNamed:[[iconArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]];
        cell.textLabel.text=[[titleArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
        if (indexPath.section==2) {
            if (indexPath.row==1) {
                NSLog(@"collect=%@",collects);
//                NSAttributedString*attrStr=[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@(%@)",[[titleArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row],collects] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10],NSForegroundColorAttributeName: [UIColor redColor]}];
//                [attrStr attribute:[[titleArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row] atIndex:2 effectiveRange:&NSMakeRange(0, 1)];
////               cell.textLabel.text=[NSString stringWithFormat:@"%@%@",[[titleArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row],attrStr];
//                [attrStr attributedSubstringFromRange:NSMakeRange(1, 3)];
                NSString*str=[NSString stringWithFormat:@"%@ (%@)",[[titleArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row],collects];
                cell.textLabel.text=str;
//                UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(150, 5, 50, 20)];
//                label.attributedText=attrStr;
//                [cell.contentView addSubview:label];
                
                
                
                
                
                
                
                
            }
        }
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0 ) {
            return 60;
        }else{
            return 50;
        }
    }
    return 35;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelect");
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

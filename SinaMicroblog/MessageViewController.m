//
//  MessageViewController.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "MessageViewController.h"
#import "QQMeCell.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //新建一个tabaleview
        
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    
    UITableView*tableview=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];

    
    
    
}
#pragma mark cellForRow
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*identifier=@"Zcell";
    Z_MessageTBCell*cell=[tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!cell) {
        cell=[[Z_MessageTBCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSArray*arrarImg=[NSArray arrayWithObjects:@"messagescenter_at@2x",@"messagescenter_comments@2x",@"messagescenter_good@2x",@"messagescenter_messagebox@2x", nil];
        NSArray*array_title=[NSArray arrayWithObjects:@"@我的",@"评论",@"赞",@"未关注人私信", nil];
        cell.icon_imageview.image=[UIImage imageNamed:[arrarImg objectAtIndex:indexPath.row]];
        cell.label.text=[array_title objectAtIndex:indexPath.row];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
#pragma mark numOfRow
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

#pragma mark heightOfRow
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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

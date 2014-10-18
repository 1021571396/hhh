//
//  HomeTableView.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-17.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "HomeTableView.h"

@implementation HomeTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height);
        UITableView*tableView=[[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
        tableView.delegate=self;
        tableView.dataSource=self;
//        tableView.backgroundColor=[UIColor redColor];
        [self addSubview:tableView];
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*identifier=@"CELL";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text=@"adf";
    return cell;
    
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

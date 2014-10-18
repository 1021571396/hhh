//
//  HomeTableViewCell.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-17.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell
@synthesize lableName,userImageView,lableTime,lableMessageFrom,lable_userContent,userContentImage;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        //用户头像
        userImageView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 35, 35)];
        userImageView.layer.cornerRadius=17.5;
        [self addSubview:userImageView];
        
        //用户名字
        lableName=[[UILabel alloc]initWithFrame:CGRectMake(50, 7, 150, 20)];
        lableName.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
        [self addSubview:lableName];
        
        //发送微博时间
        lableTime=[[UILabel alloc]initWithFrame:CGRectMake(50, 27, 45, 20)];
        lableTime.font=[UIFont fontWithName:nil size:10];
        [self addSubview:lableTime];
        
        //微博内容来自哪里(手机,网页)
        lableMessageFrom=[[UILabel alloc]initWithFrame:CGRectMake(100, 27, 150, 20)];
        lableMessageFrom.font=[UIFont fontWithName:nil size:10];
        [self addSubview:lableMessageFrom];
        
        //用户发布的微博内容
        lable_userContent=[[UILabel alloc]init];
        lable_userContent.font=[UIFont fontWithName:nil size:15];
        lable_userContent.backgroundColor=[UIColor yellowColor];
        [self addSubview:lable_userContent];
        
        //用户发布的微博图片
        userContentImage=[[UIImageView alloc]init];
        userContentImage.backgroundColor=[UIColor yellowColor];
        [self addSubview:userContentImage];
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

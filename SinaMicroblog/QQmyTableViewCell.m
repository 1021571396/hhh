//
//  QQmyTableViewCell.m
//  SinaMicroblog
//
//  Created by 5004 on 14-10-18.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import "QQmyTableViewCell.h"

@implementation QQmyTableViewCell
@synthesize btn1,btn2,btn3,label1,label2,label3;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
            btn1=[[UIButton alloc]initWithFrame:CGRectMake(0*SCREEN_W/3, 15, SCREEN_W/3, 40)];
        [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            label1=[[UILabel alloc]initWithFrame:CGRectMake(0*SCREEN_W/3, 5, SCREEN_W/3, 20)];
            label1.textAlignment=NSTextAlignmentCenter;
        
        btn2=[[UIButton alloc]initWithFrame:CGRectMake(1*SCREEN_W/3, 15, SCREEN_W/3, 40)];
        [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        label2=[[UILabel alloc]initWithFrame:CGRectMake(1*SCREEN_W/3, 5, SCREEN_W/3, 20)];
        label2.textAlignment=NSTextAlignmentCenter;

        btn3=[[UIButton alloc]initWithFrame:CGRectMake(2*SCREEN_W/3, 15, SCREEN_W/3, 40)];
        [btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        label3=[[UILabel alloc]initWithFrame:CGRectMake(2*SCREEN_W/3, 5, SCREEN_W/3, 20)];
        label3.textAlignment=NSTextAlignmentCenter;

        
            //设置字体颜色
//            NSAttributedString*attribute=[[NSAttributedString alloc]initWithString:label.text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor grayColor]}];
//            [btn setAttributedTitle:attribute forState:UIControlStateNormal];
        
        
        
        
        [self.contentView addSubview:label1];
        [self.contentView addSubview:btn1];
        [self.contentView addSubview:label2];
        [self.contentView addSubview:btn2];
        [self.contentView addSubview:label3];
        [self.contentView addSubview:btn3];
        
        
        
    }
    return self;
}
-(void)setbtnArr:(NSArray *)btnArr labelArr:(NSArray *)labelArr{
    
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

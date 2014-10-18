//
//  TabBarView.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import "TabBarView.h"

@implementation TabBarView
@synthesize buttonArray_tabbar,buttontag;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //按钮下标信息
        NSArray*textarr=[[NSArray alloc]initWithObjects:@"首页",@"消息",@"",@"发现",@"我", nil];
        
        //设置tabbar的模糊背景
        self.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-49+5, 320, 49);
        self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.98];
        //按钮
        buttonArray_tabbar=[[NSMutableArray alloc]init];
        double width=320/5;
        double height=49;
        for (int i=0; i<5; i++)
        {
            UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag=1001+i;
            //按钮坐标
            if (i < 2) {
                btn.frame = CGRectMake(width * i, -7, width, height);
            }else if (i >= 2 && i < 4) {
                btn.frame = CGRectMake(width * (i + 1), -7, width, height);
            }else if (i >= 4) {
                btn.frame = CGRectMake(width * (i - 2), 0, width, height-5);
            }
            //中间+
            if (i==4) {
                UIImage *image = [UIImage redrawImage:[UIImage imageNamed:@"tabbar_compose_icon_add@2x.png"] withFrame:CGRectMake(0, 0, 30, 30)];
                UIImage *backgroundImage = [UIImage imageNamed:@"tabbar_compose_button@2x.png"];
                [btn setImage:image forState:UIControlStateNormal];
                [btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
                buttontag=btn.tag;
            }else//另外四个
            {
                //调整标题位置
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(12, 35, 40, 15)];
                label.tag = 1010;
                [label setBackgroundColor:[UIColor clearColor]];
                label.font = [UIFont boldSystemFontOfSize:9.5];
                //未选中状态的字体颜色
                label.textColor = [UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1];
                label.text = [textarr objectAtIndex:i];
                label.textAlignment = NSTextAlignmentCenter;
                [btn addSubview:label];
                [buttonArray_tabbar addObject:btn];
            }
            [self addSubview:btn];
        }
    }
    return self;
}




@end

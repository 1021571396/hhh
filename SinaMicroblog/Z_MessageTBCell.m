//
//  Z_MessageTBCell.m
//  SinaMicroblog
//
//  Created by iGenMO on 14-10-17.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import "Z_MessageTBCell.h"

@implementation Z_MessageTBCell
@synthesize icon_imageview,label;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame=CGRectMake(0, 0, SCREEN_W, 0);
        //设置左边图片
        icon_imageview=[[UIImageView alloc]initWithFrame:CGRectMake(12, 5, 40, 40)];
        //设置标题:例如 @我的
        label=[[UILabel alloc]initWithFrame:CGRectMake(65, 15, 180, 20)];
        label.font=[UIFont systemFontOfSize:15];
        
        [self addSubview:icon_imageview];
        [self addSubview:label];
        
        
    }
    return  self;
}

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

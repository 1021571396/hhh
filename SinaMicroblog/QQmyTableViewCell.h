//
//  QQmyTableViewCell.h
//  SinaMicroblog
//
//  Created by 5004 on 14-10-18.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QQmyTableViewCell : UITableViewCell
@property(nonatomic,retain)UIButton*btn1;
@property(nonatomic,retain)UIButton*btn2;
@property(nonatomic,retain)UIButton*btn3;

@property(nonatomic,retain)UILabel*label1;
@property(nonatomic,retain)UILabel*label2;
@property(nonatomic,retain)UILabel*label3;

-(void)setbtnArr:(NSArray*)btnArr labelArr:(NSArray*)labelArr;

@end

//
//  HomeTableViewCell.h
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-17.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView*userImageView;//用户头像
@property(nonatomic,retain)UILabel*lableName;//用户名字
@property(nonatomic,retain)UILabel*lableTime;//发送微博时间
@property(nonatomic,retain)UILabel*lableMessageFrom;//微博内容来自哪里
@property(nonatomic,retain)UILabel*lable_userContent;//用户发布的微博内容
@property(nonatomic,retain)UIImageView*userContentImage;//用户发布的微博图片
@end

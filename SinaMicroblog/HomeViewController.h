//
//  HomeViewController.h
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-16.
//  Copyright (c) 2014年 Mr.Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HomeTableView.h"
#import "WeiboSDK.h"
#import "HomeTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface HomeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,WBHttpRequestDelegate>

@end

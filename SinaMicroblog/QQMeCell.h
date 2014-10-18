//
//  QQMeCell.h
//  SinaMicroblog
//
//  Created by 5004 on 14-10-18.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboSDK.h"
@interface QQMeCell : NSObject<WBHttpRequestDelegate>
-(void)myRequest;
@property(retain,nonatomic)NSDictionary*dict;
-(void)myreq:(NSDictionary*)dict;
@end

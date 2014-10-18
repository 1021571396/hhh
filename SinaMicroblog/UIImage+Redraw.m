//
//  UIImage+Redraw.m
//  Weibo
//
//  Created by Wang on 14-9-16.
//  Copyright (c) 2014年 Wang. All rights reserved.
//

#import "UIImage+Redraw.h"

@implementation UIImage (Redraw)

+(UIImage *)redrawImage:(UIImage *)image withFrame:(CGRect)frame
{
    UIGraphicsBeginImageContext(frame.size);
    [image drawInRect:frame];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

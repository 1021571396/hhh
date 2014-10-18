//
//  AppDelegate.h
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-17.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "LandingViewController.h"
#import "TabBarViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

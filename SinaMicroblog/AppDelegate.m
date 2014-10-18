//
//  AppDelegate.m
//  SinaMicroblog
//
//  Created by zhanghongwei on 14-10-17.
//  Copyright (c) 2014年 Manito. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ///注册 appkey
    //程序启动时,在代码中向微博终端注册你的 Appkey,如果首次 集成微博SDK,建议打开调试选项以便输出调试信息
    [WeiboSDK enableDebugMode:YES];//设置微博SDK的调试模式
    [WeiboSDK registerApp:kAppKey];//向微博客户端程序注册第三方应用
    
    NSLog(@"path=%@",NSHomeDirectory());
    
    
    //判断保存token的文件存不存在
    NSFileManager*fileManager=[NSFileManager defaultManager];
    NSString*plistPath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingPathComponent:@"token.plist"];
    
    NSLog(@"%@",plistPath);
    if ([fileManager fileExistsAtPath:plistPath])
    {
        //如果存在就得到token
        NSDictionary*dict=[[NSDictionary alloc]initWithContentsOfFile:plistPath];
        NSString*token_str=[dict objectForKey:@"token"];
        NSString*uid_str=[dict objectForKey:@"uid"];
        NSLog(@"%@,%@",token_str,uid_str);
        TabBarViewController*tabVC=[[TabBarViewController alloc]init];
        self.window.rootViewController=tabVC;
    }else
    {
        LandingViewController*root=[[LandingViewController alloc]init];
        self.window.rootViewController=root;
    }
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

//重写 AppDelegate 的 handleOpenURL 和 openURL 方法
//当你授权确定的时候,就会执行openUrl方法
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //处理微博客户端程序通过URL启动第三方应用时传递的数据
    return [WeiboSDK handleOpenURL:url delegate:self];
}

//收到请求
-(void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    NSLog(@"111%@",request);
}

//收到响应
-(void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    NSLog(@"222%@",response);
    if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode, response.userInfo, response.requestUserInfo];
        NSLog(@"%@",message);
        
        //将收到的token等保存下来
        if (response.userInfo!=nil) {
            NSFileManager*filemanager=[NSFileManager defaultManager];
            NSString*plistPath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingPathComponent:@"token.plist"];
            [filemanager createFileAtPath:plistPath contents:nil attributes:nil];
            NSLog(@"%@",plistPath);
            NSMutableDictionary *dictplist = [[NSMutableDictionary alloc ] init];
            //设置属性值
            
            
           [dictplist setObject:[response.userInfo objectForKey:@"access_token"] forKey:@"token"];
            [dictplist setObject:[response.userInfo objectForKey:@"expires_in"] forKey:@"expires_in"];
            [dictplist setObject:@"remind_in" forKey:@"remind_in"];
            [dictplist setObject:[response.userInfo objectForKey:@"uid"] forKey:@"uid"];
            //写入文件
            [dictplist writeToFile:plistPath atomically:YES];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:@"gotoTabBarVC" object:nil userInfo:nil];
            [[NSUserDefaults standardUserDefaults]setObject:[response.userInfo objectForKey:@"access_token"] forKey:@"token"];
            [[NSUserDefaults standardUserDefaults]setObject:[response.userInfo objectForKey:@"uid"] forKey:@"uid"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            
        }
        
    }
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SinaMicroblog" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SinaMicroblog.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end

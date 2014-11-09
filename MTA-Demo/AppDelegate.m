//
//  AppDelegate.m
//  MTA-Demo
//
//  Created by WQY on 12-12-10.
//  Copyright (c) 2012年 developer. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Feedback/FeedbackViewController.h"
#import "MTA.h"
#import "MTAConfig.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    UIViewController *viewController2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
    
    //UIViewController *feedViewController = [[[FeedbackViewController alloc] initWithNibName:@"FeedbackViewController" bundle:nil] autorelease];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = @[viewController1, viewController2];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    [[MTAConfig getInstance] setDebugEnable:TRUE];
    //[[MTAConfig getInstance] setCustomerUserID:@"1234"];
    
    //[[MTAConfig getInstance] setMaxReportEventLength:1280];
    
    //Old Appkey "DemoApp@MTA"   IG4BJ2YGZ14F
    //[MTA startWithAppkey:@"IG4BJ2YGZ14F"];
    
    //[[MTAConfig getInstance] setCustomerUserID:@"1234"];
    
    //自定义ifa
    [[MTAConfig getInstance] setIfa:@"myIfa"];
    
    //push服务的deviceToken
    [[MTAConfig getInstance] setPushDeviceToken:@"myXGDeviceToken"];
    
    //[[MTAConfig getInstance] setReportStrategy:MTA_STRATEGY_BATCH];
    
    //[[MTAConfig getInstance] setSmartReporting:FALSE];
    
      //开发key
    [MTA startWithAppkey:@"IG4BJ2YGZ14F"];
    
    //[MTA startWithAppkey:@"IG4BJ2YGZ14F"];
    
    //[MTA reportQQ:@"5059175"];
    
    [MTA reportAccount:@"5059175" type:1 ext:@"test"];
    
    /*
    if(![MTA startWithAppkey:@"I8S27BWQ6HYL" checkedSdkVersion:MTA_SDK_VERSION]){
        //handle exception
    }
     */
    
    
    //[MTA startWithAppkey:@"DemoApp@MTA" checkedSdkVersion:@"0.9.0"];
    //[MTA startWithAppkey:@"DemoApp@MTA"];
    //[MTA trackGameUser:@"g123" world:@"sz1" level:@"10"];

    //[MTA trackError:@"I'm error"];
    
    return YES;
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end

//
//  AZAppDelegate.m
//  AZAppearanceKitDemo
//
//  Created by Zachary Waldowski on 6/19/12.
//  Copyright (c) 2012 Alexsander Akers & Zachary Waldowski. All rights reserved.
//

#import "AZAppearanceKitDemoAppDelegate.h"
#import "AZLabelDemoViewController.h"
#import "AZGradientDemoViewController.h"
#import "AZShadowedTableDemoViewController.h"
#import "AZTableViewCellDemoViewController.h"
#import "AZBarDemoViewController.h"

@implementation AZAppearanceKitDemoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.tabBarController = [UITabBarController new];
	UIViewController *viewController1 = [[AZLabelDemoViewController alloc] initWithNibName: @"AZLabelDemoViewController" bundle:nil];
	UIViewController *viewController2 = [[AZGradientDemoViewController alloc] initWithNibName: @"AZGradientDemoViewController" bundle:nil];
	UIViewController *viewController3 = [[AZShadowedTableDemoViewController alloc] initWithNibName: @"AZShadowedTableDemoViewController" bundle: nil];
	UIViewController *viewController4 = [[AZTableViewCellDemoViewController alloc] initWithStyle: UITableViewStyleGrouped];
	UIViewController *viewController5 = [[AZBarDemoViewController alloc] initWithNibName: @"AZBarDemoViewController" bundle: nil];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects: viewController1, viewController2, viewController3, viewController4,  viewController5, nil];
	self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
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

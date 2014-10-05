//
//  AppDelegate.m
//  Sauron
//
//  Created by Miguel Hernández Jaso on 04/10/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#import "AppDelegate.h"

// Sauron
#import "MHJStoryboardsHeader.h"
#import "MHJSauron.h"
#import "MHJStoryboardBuilder.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Init

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // With TabBar (using MHJStoryboardBuilder)
    UITabBarController *tabVC = [MHJStoryboardBuilder tabBarControllerWithStoryboardNames:@[SB_FRODO, SB_GANDALF,SB_SAURON]];
    [self.window setRootViewController:tabVC];
    
    // Setting a single NavigationController (using switchToStoryboardNamed:...)
    //[MHJSauron switchToStoryboardNamed:SB_FRODO withViewIdentifier:nil returningViewController:nil];
    
    // Manually
    /*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:SB_FRODO bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:[storyboard instantiateViewControllerWithIdentifier:VIEW_IDENTIFIER_DETAIL]];
    [self.window setRootViewController:navVC];
     */
    
    [self.window makeKeyAndVisible];
    return YES;
}



@end

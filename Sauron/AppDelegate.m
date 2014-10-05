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
    
    UITabBarController *tabVC = [MHJStoryboardBuilder tabBarControllerWithStoryboardNames:@[SB_FRODO, SB_GANDALF,SB_SAURON]];
    [self.window setRootViewController:tabVC];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}



@end

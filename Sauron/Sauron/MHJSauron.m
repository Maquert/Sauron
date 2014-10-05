//
//  MHJSauron.m
//  Sauron
//
//  Created by Miguel Hernández Jaso on 04/10/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#import "MHJSauron.h"

// Utils
#import "MHJSauronErrorFormats.h"
#import "UIViewController+Utils.h"



@implementation MHJSauron


#pragma mark - Public Methods
#pragma mark - Switch Root ViewController

+(UIViewController *) switchToStoryboardNamed:(NSString *)storyboardName
                           withViewIdentifier:(NSString *)viewIdentifier
                      returningViewController:(void (^)(id nextVC))block
{
    UIStoryboard *storyboard = [self storyboardNamed:storyboardName];
    UIViewController *nextController = [self instantiateStoryboard:storyboard withViewIdentifier:viewIdentifier];
    
    if ([nextController isNavigationController]) {
        UIViewController *nextVC = [[(UINavigationController *) nextController viewControllers] firstObject];
        
        if (block) {
            block(nextVC);
        }
        [self setRootWithController:nextController];
    }
    else {
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:nextController];
        
        if (block) {
            block(nextController);
        }
        
        [self setRootWithController:navVC];
    }
    
    return nextController;
}


#pragma mark - Push ViewController

+(UIViewController *) pushToStoryboardNamed:(NSString *)storyboardName
                         withViewIdentifier:(NSString *)viewIdentifier
                    returningViewController:(void (^)(id nextVC))block
{
    UIViewController *currentVC = [self nextVisibleViewController];
    UIViewController *nextVC = [self pushToStoryboardNamed:storyboardName
                                        withViewIdentifier:viewIdentifier
                                        fromViewController:currentVC
                                   returningViewController:block];
    
    return nextVC;
}

+(UIViewController *) pushToStoryboardNamed:(NSString *)storyboardName
                         withViewIdentifier:(NSString *)viewIdentifier
                         fromViewController:(UIViewController *) currentVC
                    returningViewController:(void (^)(id nextVC))block
{
    UIStoryboard *storyboard = [self storyboardNamed:storyboardName];
    UIViewController *nextController = [self instantiateStoryboard:storyboard withViewIdentifier:viewIdentifier];
    nextController = [self pushableViewController:nextController];
    
    if (block) {
        block(nextController);
    }
    
    if (currentVC.navigationController) {
        [currentVC.navigationController pushViewController:nextController animated:YES];
    }
    else {
        NSLog(ERROR_NO_NAVIGATION_CONTROLLER_FORMAT, [self class], currentVC);
    }
    
    return nextController;
}


+(UIViewController *) pushableViewController:(UIViewController *) nextVC
{
    if ([nextVC isNavigationController]) {
        nextVC = [(UINavigationController *) nextVC viewControllers].firstObject;
    }
    
    return nextVC;
}


+(BOOL) isPushSupportedForViewController:(UIViewController*) viewController
{
    if ([viewController isNavigationController]) {
        NSLog(ERROR_PUSHING_NAVIGATION_CONTROLLER_NOT_SUPPORTED, [self class], viewController);
        return NO;
    }
    
    return YES;
}





#pragma mark - Present Modal ViewController

+(UIViewController *) presentStoryboardNamed:(NSString *) storyboardName
                          withViewIdentifier:(NSString *) viewIdentifier
                          fromViewController:(UIViewController *) currentViewController
                     returningViewController:(void (^)(id nextVC)) block
{
    UIStoryboard *storyboard = [self storyboardNamed:storyboardName];
    UIViewController *nextVC = [self instantiateStoryboard:storyboard withViewIdentifier:viewIdentifier];
    
    if (block) {
        block(nextVC);
    }
    
    [currentViewController presentViewController:nextVC animated:YES completion:nil];
    
    return nextVC;
}

+(UIViewController *) hookStoryboardNamed:(NSString *) storyboardName
                       withViewIdentifier:(NSString *) viewIdentifier
                       fromViewController:(UIViewController *) currentViewController
                  returningViewController:(void (^)(id nextVC)) block
{
    UIStoryboard *storyboard = [self storyboardNamed:storyboardName];
    UIViewController *nextVC = [self instantiateStoryboard:storyboard withViewIdentifier:viewIdentifier];
    
    if (block) {
        block(nextVC);
    }
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:nextVC];
    [currentViewController presentViewController:navVC animated:YES completion:nil];
    
    return nextVC;
    
}






#pragma mark - Intrusive Modal ViewControllers (Interrupt)

+(UIViewController *) interruptWithStoryboardNamed:(NSString *)storyboardName
                                withViewIdentifier:(NSString *)viewIdentifier
                           returningViewController:(void (^)(id nextVC))block
{
    UIStoryboard *storyboard = [self storyboardNamed:storyboardName];
    UIViewController *nextVC = [self instantiateStoryboard:storyboard withViewIdentifier:viewIdentifier];
    UIViewController *rootVC = [self appRootVC];
    
    if (block) {
        block(nextVC);
    }
    
    [rootVC presentViewController:nextVC animated:YES completion:nil];
    
    return nextVC;
}








#pragma mark - Private Methods

#pragma mark - Navigation

+(void) pushFromCurrentVCToNextVC:(UIViewController *) nextVC
{
    UIViewController *rootVC = [self appRootVC];
    if (rootVC.navigationController) {
        [rootVC.navigationController dismissViewControllerAnimated:NO completion:nil];
        UIViewController *currentVC = [rootVC.navigationController visibleViewController];
        [currentVC.navigationController pushViewController:nextVC animated:YES];
    }
    else
    {
        NSLog(ERROR_NO_NAVIGATION_CONTROLLER_FORMAT, [self class], rootVC);
    }
}

+(UIViewController *) nextVisibleViewController
{
    UIViewController *rootVC = [self appRootVC];
    UIViewController *visibleVC = [rootVC.navigationController visibleViewController];
    return visibleVC;
}





#pragma mark - Storyboards

+(UIStoryboard *) storyboardNamed:(NSString *) storyboardName
{
    @try {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName
                                                             bundle:nil];
        return storyboard;
    }
    @catch (NSException *exception) {
        NSLog(ERROR_NO_STORYBOARD_FOUND, [self class], storyboardName);
    }
    return nil;
}

+(UIViewController *) instantiateStoryboard:(UIStoryboard *) storyboard
                         withViewIdentifier:(NSString *) identifier
{
    @try {
        if ([identifier isEqualToString:@""] || identifier == nil) {
            return [storyboard instantiateInitialViewController];
        }
        else {
            return [storyboard instantiateViewControllerWithIdentifier:identifier];
        }
    }
    @catch (NSException *exception) {
        NSLog(ERROR_NO_VIEWCONTROLLER_FOUND, [self class], identifier, storyboard.description);
    }
    
    
}





#pragma mark - Handy View Controllers

+(UINavigationController *) navigationControllerForViewController:(UIViewController *) viewController
{
    UINavigationController *navVC = viewController.navigationController;
    if (navVC == nil) {
        navVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    }
    return navVC;
}


+(UIViewController *) appRootVC
{
    UIApplication *application = [UIApplication sharedApplication];
    UIViewController *rootVC = [[[application delegate] window] rootViewController];
    
    return rootVC;
}

+(void) setRootWithController:(UIViewController *) viewController
{
    UIWindow *appWindow = [[[UIApplication sharedApplication] delegate] window];
    [appWindow setRootViewController:viewController];
}





@end

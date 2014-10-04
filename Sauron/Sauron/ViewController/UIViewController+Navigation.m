//
//  UIViewController+Navigation.m
//  LineaCero
//
//  Created by Miguel Hernández Jaso on 09/08/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#import "UIViewController+Navigation.h"

// Utils
#import "MHJViewNavigatorFormats.h"
#import "UIViewController+Utils.h"


@implementation UIViewController (Navigation)


#pragma mark - Push ViewController

-(UIViewController *) pushToStoryboardNamed:(NSString *)storyboardName
                         withViewIdentifier:(NSString *)viewIdentifier
                    returningViewController:(void (^)(id nextVC))block
{
    UIStoryboard *storyboard = [self storyboardNamed:storyboardName];
    UIViewController *nextController = [self instantiateStoryboard:storyboard withViewIdentifier:viewIdentifier];
    
    if ([nextController isNavigationController]) {
        UINavigationController *navVC = (UINavigationController *) nextController;
        UIViewController *nextVC = [[navVC viewControllers] firstObject];
        if (block) {
            block(nextVC);
        }
        [self.navigationController pushViewController:navVC animated:YES];
    }
    else {
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:nextController];
        if (block) {
            block(nextController);
        }
        [self.navigationController pushViewController:navVC animated:YES];
    }
    
    return nextController;
}




#pragma mark - Present Modal ViewController

-(UIViewController *) presentStoryboardNamed:(NSString *) storyboardName
                          withViewIdentifier:(NSString *) viewIdentifier
                     returningViewController:(void (^)(id nextVC)) block
{
    UIStoryboard *storyboard = [self storyboardNamed:storyboardName];
    UIViewController *nextVC = [self instantiateStoryboard:storyboard withViewIdentifier:viewIdentifier];
    
    if (block) {
        block(nextVC);
    }
    
    [self presentViewController:nextVC animated:YES completion:nil];
    
    return nextVC;
}







#pragma mark - Private Methods

#pragma mark - Storyboards

-(UIStoryboard *) storyboardNamed:(NSString *) storyboardName
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

-(UIViewController *) instantiateStoryboard:(UIStoryboard *) storyboard
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

-(UINavigationController *) navigationControllerForViewController:(UIViewController *) viewController
{
    UINavigationController *navVC = viewController.navigationController;
    if (navVC == nil) {
        navVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    }
    return navVC;
}





@end

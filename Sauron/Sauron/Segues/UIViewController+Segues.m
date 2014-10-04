//
//  UIViewController+Segues.m
//  LineaCero
//
//  Created by Miguel Hernández Jaso on 15/06/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#import "UIViewController+Segues.h"

@implementation UIViewController (Segues)


-(BOOL) nextSegue:(UIStoryboardSegue *)segue
 viewControllerIs:(Class)destinationViewController
{
    if ([segue.destinationViewController isKindOfClass:destinationViewController.class]) {
        return true;
    }
    
    return false;
}


-(BOOL) nextSegue:(UIStoryboardSegue *)segue
firstObjectIsClass:(Class)destinationViewController
{
    UINavigationController *suspiciusNavVC = segue.destinationViewController;
    if ([suspiciusNavVC isKindOfClass:[UINavigationController class]] == NO) {
        return NO;
    }
    if ([[suspiciusNavVC.viewControllers firstObject] isKindOfClass:[destinationViewController class]]) {
        return YES;
    }
    
    return false;

}



@end

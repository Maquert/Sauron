//
//  UIViewController+Utils.m
//  LineaCero
//
//  Created by Miguel Hernández Jaso on 8/8/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)


-(BOOL) isNavigationController
{
    if ([self isKindOfClass:[UINavigationController class]])
    {
        return YES;
    }
    
    return NO;
}

@end

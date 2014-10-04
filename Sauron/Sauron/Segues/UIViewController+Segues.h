//
//  UIViewController+Segues.h
//  LineaCero
//
//  Created by Miguel Hernández Jaso on 15/06/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

@import UIKit;

@interface UIViewController (Segues)

-(BOOL) nextSegue:(UIStoryboardSegue *)segue
 viewControllerIs:(Class)destinationViewController;
// For NavigationController Support
-(BOOL) nextSegue:(UIStoryboardSegue *)segue
firstObjectIsClass:(Class)destinationViewController;

@end

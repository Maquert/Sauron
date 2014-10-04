//
//  UIViewController+Navigation.h
//  LineaCero
//
//  Created by Miguel Hernández Jaso on 09/08/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

@import UIKit;


@class MHJViewNavigator;

#import "StoryboardsHeader.h"
#import "MHJStoryboardBuilder.h"
#import "UIViewController+Segues.h"

@interface UIViewController (Navigation)


#pragma mark - Instance Methods

// Push to another View
-(UIViewController *) pushToStoryboardNamed:(NSString *) storyboardName
                         withViewIdentifier:(NSString *) viewIdentifier
                    returningViewController:(void (^)(id nextVC)) block;


// Present as Modal View
-(UIViewController *) presentStoryboardNamed:(NSString *) storyboardName
                          withViewIdentifier:(NSString *) viewIdentifier
                     returningViewController:(void (^)(id nextVC)) block;



@end

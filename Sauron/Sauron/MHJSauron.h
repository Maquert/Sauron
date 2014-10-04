//
//  MHJSauron.h
//  Sauron
//
//  Created by Miguel Hernández Jaso on 04/10/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//
//  One Class to rule them all,
//  One Class to find them,
//  One Class to bring them all and in the stroyboards bind them
//


@import UIKit;

@class MHJSauron;

@interface MHJSauron : NSObject


#pragma mark - Static Methods
// Re-Assign Root View Controller
+(UIViewController *) switchToStoryboardNamed:(NSString *) storyboardName
                           withViewIdentifier:(NSString *) viewIdentifier
                      returningViewController:(void (^)(id nextVC)) block;;


// Push to another View
+(UIViewController *) pushToStoryboardNamed:(NSString *) storyboardName
                         withViewIdentifier:(NSString *) viewIdentifier
                    returningViewController:(void (^)(id nextVC)) block;

+(UIViewController *) pushToStoryboardNamed:(NSString *)storyboardName
                         withViewIdentifier:(NSString *)viewIdentifier
                         fromViewController:(UIViewController *) currentVC
                    returningViewController:(void (^)(id nextVC))block;




// Present as Modal View
+(UIViewController *) presentStoryboardNamed:(NSString *) storyboardName
                          withViewIdentifier:(NSString *) viewIdentifier
                          fromViewController:(UIViewController *) currentViewController
                     returningViewController:(void (^)(id nextVC)) block;
// Adding Navigation Controller in the process
+(UIViewController *) hookStoryboardNamed:(NSString *) storyboardName
                       withViewIdentifier:(NSString *) viewIdentifier
                       fromViewController:(UIViewController *) currentViewController
                  returningViewController:(void (^)(id nextVC)) block;


// Present from Root View Controller

+(UIViewController *) interruptWithStoryboardNamed:(NSString *) storyboardName
                                withViewIdentifier:(NSString *) viewIdentifier
                           returningViewController:(void (^)(id nextVC)) block;

+(UIViewController *) appRootVC;




@end

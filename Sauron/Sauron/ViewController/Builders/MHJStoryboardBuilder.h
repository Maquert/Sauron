//
//  MHJStoryboardBuilder.h
//  ViewNavigator
//
//  Created by Miguel Hernández Jaso on 30/07/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

@import UIKit;

@interface MHJStoryboardBuilder : NSObject

#pragma mark - Init
+(instancetype) storyboardBuilderWithArrayOfStoryboards:(NSArray *) storyboards;
-(instancetype) initWithArrayOfStoryboards:(NSArray *) storyboards;

#pragma mark - Storyboards Names Init
+(instancetype) storyboardBuilderWithArrayOfStoryboardNames:(NSArray *)storyboardNames;
-(instancetype) initWithArrayOfStoryboardNames:(NSArray *) storyboardNames;



#pragma mark - Class methods
+(UITabBarController *) tabBarControllerWithStoryboardNames:(NSArray *) storyboardNames;
+(UISplitViewController *) splitViewControllerWithStoryboardNames:(NSArray *) storyboardNames;


#pragma mark - Instance methods
-(UITabBarController *) tabBarController;
-(UISplitViewController *) splitViewController;


#pragma mark - Accessors
-(NSArray *) storyboards;
-(UIStoryboard *) storyboardAtIndex:(NSUInteger) index;
-(UIStoryboard *) firstStoryboard;
-(UIStoryboard *) lastStoryboard;





@end

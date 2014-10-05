//
//  MHJStoryboardBuilder.m
//  ViewNavigator
//
//  Created by Miguel Hernández Jaso on 30/07/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#import "MHJStoryboardBuilder.h"

// Utils
#import "MHJSauronErrorFormats.h"


@interface MHJStoryboardBuilder ()

@property (strong, nonatomic) NSArray *storyboards;

@end


@implementation MHJStoryboardBuilder


#pragma mark - Init


#pragma mark - Storyboards Init

+(instancetype) storyboardBuilderWithArrayOfStoryboards:(NSArray *) storyboards
{
    return [[self alloc] initWithArrayOfStoryboards:storyboards];
}
-(instancetype) initWithArrayOfStoryboards:(NSArray *) storyboards
{
    if (self = [super init]) {
        _storyboards = storyboards;
    }
    
    return self;
}



#pragma mark - Storyboards from Names Init

+(instancetype) storyboardBuilderWithArrayOfStoryboardNames:(NSArray *)storyboardNames
{
    return [[self alloc] initWithArrayOfStoryboardNames:storyboardNames];
}
-(instancetype) initWithArrayOfStoryboardNames:(NSArray *) storyboardNames
{
    if (self = [super init]) {
        _storyboards = [[self class] storyboardsFromIdentifiers:storyboardNames];
    }
    
    return self;
}



#pragma mark - Builders

-(UITabBarController *) tabBarController
{
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    NSArray *viewControllers = [self viewControllersFromStoryboards];
    [tabBar setViewControllers:viewControllers];
    [[self class] setupAppWindow];
    
    return tabBar;
}

-(UISplitViewController *) splitViewController
{
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    NSArray *viewControllers = [self viewControllersFromStoryboards];
    [splitVC setViewControllers:viewControllers];
    [[self class] setupAppWindow];
    
    return splitVC;
}


-(NSArray *) viewControllersFromStoryboards
{
    NSMutableArray *controllersMutable = [NSMutableArray new];
    
    for (UIStoryboard *storyboard in self.storyboards)
    {
        UIViewController *viewController = [storyboard instantiateInitialViewController];
        
        UINavigationController *navVC = viewController.navigationController;
        if (navVC == nil) {
            navVC = [[UINavigationController alloc] initWithRootViewController:viewController];
        }
        
        [controllersMutable addObject:navVC];
    }

    return [controllersMutable copy];
}








#pragma mark - Class Methods

+(NSArray *) storyboardsFromIdentifiers:(NSArray *) storyboardNames
{
    NSMutableArray *storyBoardsMutable = [NSMutableArray new];
    for (NSString *sbName in storyboardNames) {
        @try {
            UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName
                                                         bundle:nil];
            [storyBoardsMutable addObject:sb];
            
        }
        @catch (NSException *exception) {
            NSLog(ERROR_NO_STORYBOARD_FOUND, [self class], sbName);
        }
    }
    
    return [storyBoardsMutable copy];
}














#pragma mark - Static Builders

+(UITabBarController *) tabBarControllerWithStoryboardNames:(NSArray *)storyboardNames
{
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    NSArray *viewControllers = [self viewControllersFromStoryboardsArray:storyboardNames];
    [tabBar setViewControllers:viewControllers];
    [[self class] setupAppWindow];
    
    return tabBar;
}

+(UISplitViewController *) splitViewControllerWithStoryboardNames:(NSArray *)storyboardNames
{
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    NSArray *viewControllers = [self viewControllersFromStoryboardsArray:storyboardNames];
    [splitVC setViewControllers:viewControllers];
    [[self class] setupAppWindow];
    
    return splitVC;
}










#pragma mark - Utils

+(void) setupAppWindow
{
    UIWindow *window;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate window] == nil) {
        window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [appDelegate setWindow:window];
        [window makeKeyAndVisible];
    }
}


+(NSArray *) viewControllersFromStoryboardsArray:(NSArray *) storyboardsNames
{
    NSMutableArray *controllersMutable = [NSMutableArray new];
    
    NSArray *storyboards = [self storyboardsFromIdentifiers:storyboardsNames];
    
    for (UIStoryboard *storyboard in storyboards) {
        UIViewController *viewController = [storyboard instantiateInitialViewController];
    
        if (viewController != nil) {
            [controllersMutable addObject:viewController];
        }
        else {
            NSLog(@"[%@] Storyboard '%@' has no Initial ViewController", [self class], [storyboard valueForKey:@"name"]);
        }
    }
    
    return [controllersMutable copy];
}





#pragma mark - Properties

-(NSArray *) storyboards
{
    return _storyboards;
}

-(UIStoryboard *) storyboardAtIndex:(NSUInteger) index
{
    return [self.storyboards objectAtIndex:index];
}

-(UIStoryboard *) firstStoryboard
{
    return [self.storyboards firstObject];
}

-(UIStoryboard *) lastStoryboard
{
    return [self.storyboards lastObject];
}





@end

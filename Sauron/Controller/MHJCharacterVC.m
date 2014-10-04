//
//  MHJViewController.m
//  Sauron
//
//  Created by Miguel Hernández Jaso on 04/10/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#import "MHJCharacterVC.h"

// Navigation
#import "MHJStoryboardsHeader.h"
#import "MHJSauron.h"

@implementation MHJCharacterVC


#pragma mark - Init

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTouchEvents];
}

-(void) setupTouchEvents
{
    [self.view addGestureRecognizer:[self singleTap]];
    [self.view addGestureRecognizer:[self doubleTap]];
    [self.view addGestureRecognizer:[self tripleTap]];
}





#pragma mark - TapGestures

-(UITapGestureRecognizer *) singleTap
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToNextStoryboard)];
    [singleTap setNumberOfTapsRequired:1];
    
    return singleTap;
}

-(UITapGestureRecognizer *) doubleTap
{
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentNextStoryboard)];
    [doubleTap setNumberOfTapsRequired:2];
    
    return doubleTap;
}

-(UITapGestureRecognizer *) tripleTap
{
    UITapGestureRecognizer *tripleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(restartNavigation)];
    [tripleTap setNumberOfTapsRequired:3];
    
    return tripleTap;
}







#pragma mark - Events

-(void) pushToNextStoryboard
{
    [MHJSauron pushToStoryboardNamed:SB_FRODO withViewIdentifier:nil
                  fromViewController:self
             returningViewController:^(id nextVC) {
        NSLog(@"[%@] Pushing to %@!", [self class], nextVC);
    }];
}

-(void) presentNextStoryboard
{
    [MHJSauron presentStoryboardNamed:SB_FRODO withViewIdentifier:nil
                   fromViewController:nil
              returningViewController:^(id nextVC) {
        NSLog(@"[%@] Pushing to %@!", [self class], nextVC);
    }];
}

-(void) restartNavigation
{
    [MHJSauron switchToStoryboardNamed:SB_FRODO withViewIdentifier:nil
               returningViewController:^(id nextVC) {
        NSLog(@"[%@] Pushing to %@!", [self class], nextVC);
    }];
}

-(void) interruptNavigation
{
    [MHJSauron interruptWithStoryboardNamed:SB_FRODO withViewIdentifier:nil returningViewController:^(id nextVC) {
        NSLog(@"[%@] Pushing to %@!", [self class], nextVC);
    }];
}








@end

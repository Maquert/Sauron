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
#import "Sauron.h"

#import "Sauron-Swift.h"

@interface MHJCharacterVC ()

@end


@implementation MHJCharacterVC


#pragma mark - Init

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    [self setupForModalView];
    
}

-(void) setupForModalView
{
    if ([self isPresented]) {
        [self.instructions setHidden:NO];
        [self addTapToClose];
    }
}

-(void) addTapToClose
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(viewTapped:)];
    [self.view addGestureRecognizer:tap];
}



#pragma mark - Events

-(IBAction) sauronButtonTapped:(id)sender
{
    [self pushToStoryboardNamed:SB_SAURON];
}
-(IBAction) frodoButtonTapped:(id)sender
{
    [self presentStoryboardNamed:SB_FRODO];
}
-(IBAction) gandalfButtonTapped:(id)sender
{
    [self interruptNavigationWithStoryboardNamed:SB_GANDALF];
}
-(void) viewTapped:(id) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark - Navigation

-(void) pushToStoryboardNamed:(NSString *) storyboardName
{
 /*   [self pushToStoryboardNamed:storyboardName
             withViewIdentifier:nil
        returningViewController:^(id nextVC) {
        NSLog(@"[%@] Pushing to %@!", [self class], nextVC);
    }];*/
    [self pushToStoryboard:nil identifier:nil completion:nil];
    /*[MHJSauron pushToStoryboardNamed:storyboardName withViewIdentifier:nil fromViewController:self returningViewController:^(id nextVC)
    {
        NSLog(@"[%@] Pushing to %@!", [self class], nextVC);
    }];*/
    /*
    [MHJSauron pushToStoryboardNamed:storyboardName withViewIdentifier:nil returningViewController:^(id nextVC) {
         NSLog(@"[%@] Pushing to %@!", [self class], nextVC);
    }];*/
}


-(void) presentStoryboardNamed:(NSString *) storyboardName
{
    [self presentStoryboardNamed:storyboardName
              withViewIdentifier:@"detailVC"
         returningViewController:nil];
    [MHJSauron presentStoryboardNamed:storyboardName
                   withViewIdentifier:VIEW_IDENTIFIER_DETAIL
                   fromViewController:self
              returningViewController:^(id nextVC) {
                  MHJCharacterVC *characterVC = nextVC;
                  [characterVC setIsPresented:YES];
        NSLog(@"[%@] Presenting to %@!", [self class], nextVC);
    }];
}

-(void) restartNavigationWithStoryboardNamed:(NSString *) storyboardName
{
    [MHJSauron switchToStoryboardNamed:storyboardName
                    withViewIdentifier:VIEW_IDENTIFIER_DETAIL
               returningViewController:^(id nextVC) {
        NSLog(@"[%@] Switching to %@!", [self class], nextVC);
    }];
}

-(void) interruptNavigationWithStoryboardNamed:(NSString *) storyboardName
{
    [MHJSauron interruptWithStoryboardNamed:storyboardName
                         withViewIdentifier:VIEW_IDENTIFIER_DETAIL
                    returningViewController:^(id nextVC) {
                        MHJCharacterVC *characterVC = nextVC;
                        [characterVC setIsPresented:YES];
        NSLog(@"[%@] Interrupting with %@!", [self class], nextVC);
    }];
}









@end

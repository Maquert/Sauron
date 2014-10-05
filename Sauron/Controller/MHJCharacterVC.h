//
//  MHJViewController.h
//  Sauron
//
//  Created by Miguel Hernández Jaso on 04/10/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//
//  Abstract class. Do not instantiate.
//

@import UIKit;

@interface MHJCharacterVC : UIViewController

#pragma mark - Outlets
@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *instructions;

#pragma mark - Public Properties
@property (nonatomic) BOOL isPresented;

#pragma mark - Initial Setup


@end

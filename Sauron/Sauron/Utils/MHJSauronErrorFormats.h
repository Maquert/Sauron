//
//  ErrorFormats.h
//  Sauron
//
//  Created by Miguel Hernández Jaso on 04/10/14.
//  Copyright (c) 2014 Miguel Hernández Jaso. All rights reserved.
//

#ifndef Sauron_MHJSauronErrorFormats_h
#define Sauron_MHJSauronErrorFormats_h

#define PRE @"[%@] - "
#define ERROR_NO_NAVIGATION_CONTROLLER_FORMAT PRE@"Error: Could not push because there is no NavigationController initiliazed for ViewController '%@'."
#define ERROR_PUSHING_NAVIGATION_CONTROLLER_NOT_SUPPORTED @"[%@] Pushing a Navigation Controller is not supported!\nReceived view controller: %@"
#define ERROR_NO_STORYBOARD_FOUND PRE@"Error: Storyboard named '%@' was not found in your project"
#define ERROR_NO_VIEWCONTROLLER_FOUND PRE@"Error: ViewIdentifier '%@' was not found in Storyboard '%@'"

#endif

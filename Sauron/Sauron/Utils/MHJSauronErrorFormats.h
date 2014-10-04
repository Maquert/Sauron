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
#define ERROR_NO_NAVIGATION_CONTROLLER_FORMAT PRE@"Error: Couldn't retrieve your current View Controller.\nAn active NavigationController must be initialized first."

#define ERROR_NO_STORYBOARD_FOUND PRE@"Error: Storyboard named '%@' was not found in your project"
#define ERROR_NO_VIEWCONTROLLER_FOUND PRE@"Error: ViewIdentifier '%@' was not found in Storyboard '%@'"

#endif

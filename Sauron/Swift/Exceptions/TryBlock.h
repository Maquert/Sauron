//
//  TryBlock.h
//  FICRES
//
//  Created by Miguel Hernández Jaso on 1/27/15.
//  Copyright (c) 2015 samelan. All rights reserved.
//

//
//  Swift doesn't support TryCatch functionality
//  'TryBlock' provides it through Objective-C
//


//@import Foundation;
#import <Foundation/Foundation.h>

@interface TryBlock : NSObject


+(void) try:( void(^) () ) try
      catch:( void(^) (NSException *exception) ) catch
    finally:( void(^) () ) finally;




@end

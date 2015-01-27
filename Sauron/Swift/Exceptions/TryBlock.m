//
//  TryBlock.m
//  FICRES
//
//  Created by Miguel Hernández Jaso on 1/27/15.
//  Copyright (c) 2015 samelan. All rights reserved.
//

#import "TryBlock.h"

@implementation TryBlock




+(void) try:( void(^) () ) try
      catch:( void(^) (NSException *exception) ) catch
    finally:( void(^) () ) finally
{
    @try {
        if (try) {
            try();
        }
    }
    @catch (NSException *exception) {
        if (catch) {
            catch(exception);
        }
    }
    @finally {
        if (finally) {
            finally();
        }
    }
}





@end

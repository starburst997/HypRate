/*
Copyright (c) 2013, Hyperfiction
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#import <UIKit/UIKit.h>
#include <HypRate.h>
#include "include/Appirater.h"

//Externs
	typedef void( *FunctionType)( );
	
//interface

	@interface HypRate : NSObject
		
	@end

	@interface NMEAppDelegate : NSObject <UIApplicationDelegate>
		
	@end


//implementation

	@implementation NMEAppDelegate (HypRate)
		
	@end

	@implementation HypRate
	
		-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
			return YES;
		}
		
		-(void)applicationWillEnterForeground:(UIApplication *)application{
			[Appirater appEnteredForeground:NO];
		}
	
	@end

//
namespace hyprate{

    /**
	*
	*
	* @public
	* @return	void
	*/
	void setAppId( const char *s ){
		[Appirater setAppId:[[NSString alloc] initWithUTF8String:s]];
	}

	/**
	*
	*
	* @public
	* @return	void
	*/
	void setDialog_title( const char *s ){
		[Appirater setCustomAlertTitle:[[NSString alloc] initWithUTF8String:s]];
	}
	
	/**
	*
	*
	* @public
	* @return	void
	*/
	void setStore( const char *s ){
		NSLog(@"Not implemented in iOS");
	}

	/**
	*
	*
	* @public
	* @return	void
	*/
	void setDialog_msg( const char *s ){
		[Appirater setCustomAlertMessage:[[NSString alloc] initWithUTF8String:s]];
	}

	/**
	*
	*
	* @public
	* @return	void
	*/
	void setPositive_text( const char *s ){
		[Appirater setCustomAlertRateButtonTitle:[[NSString alloc] initWithUTF8String:s]];
	}

	/**
	*
	*
	* @public
	* @return	void
	*/
	void setNeutral_text( const char *s ){
		[Appirater setCustomAlertRateLaterButtonTitle:[[NSString alloc] initWithUTF8String:s]];
	}

	/**
	*
	*
	* @public
	* @return	void
	*/
	void setCancel_text( const char *s ){
		[Appirater setCustomAlertCancelButtonTitle:[[NSString alloc] initWithUTF8String:s]];
	}
    
	/**
	*
	*
	* @public
	* @return	void
	*/
	void start( int minL , int minD , int untilL , int unitD ){
		[Appirater setUsesUntilPrompt:minL];
		[Appirater setDaysUntilPrompt:minD];
        // Disable significant event criterion
		[Appirater setSignificantEventsUntilPrompt:-1];
		[Appirater setTimeBeforeReminding:unitD];
		[Appirater setDebug:YES];
		
		[Appirater userDidSignificantEvent:YES];
	}

	/**
	*
	*
	* @public
	* @return	void
	*/
	void show( ){
        [Appirater forceShowPrompt:YES];
	}


}

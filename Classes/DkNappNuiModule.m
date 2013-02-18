/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "DkNappNuiModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "NUIAppearance.h"
#import <UIKit/UIKit.h>

@implementation DkNappNuiModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"9b5e325b-d13d-416d-b2c8-76890a30142d";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"dk.napp.nui";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)navigationBar:(id)value
{
    
    NSString * stylesheet = [TiUtils stringValue:value];
    NSLog(@"NUI loaded with style %@", stylesheet);
    [NUIAppearance init];
    //[NUISettings initWithStylesheet:@"SkyBlue.NUI"];
    
    //[NUISettings loadStylesheetByPath:stylesheet];
    
    //[NUISettings initWithStylesheet:stylesheet];
    //[NUISettings setAutoUpdatePath:@"Style2.nss"];
    
    
    NSLog(@"setNavigationBar");
    
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:100.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
      nil]];
    
    
    //button
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0], UITextAttributeTextColor,
      [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0], UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
      nil] forState:UIControlStateNormal];
    
    //toolbar tint
    [[UIToolbar appearance] setTintColor:[UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0]];
    
    
}

@end

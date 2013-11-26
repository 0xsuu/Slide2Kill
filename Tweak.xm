//Slide2Kill - Tweak.xm
//version: 0.0.3
//Author: Suu

#import "SBIconView.h"
#import "SBAppSwitcherController.h"
#import "SBAppSwitcherBarView.h"
#import "SBIcon.h"
#import "SBUIController.h"

SBIconView *onIcon;
BOOL isDragging = NO;
BOOL killIcon = NO;
BOOL killAll = NO;
BOOL killAllIcons = NO;

#define IPAD

#ifdef IPAD
    #define ICONPOS 17
#else
    #define ICONPOS 16
#endif

%hook SBAppSwitcherController

-(void)iconTouchBegan:(id)icon
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	onIcon = icon;
	%orig;
    }
    else
    {
	%orig;
    }
    
    [dict release];
    
}

-(void)iconHandleLongPress:(id)press
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	
    }
    else
    {
	%orig;
    }
    
    [dict release];
}

-(void)_beginEditing
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	
    }
    else
    {
	%orig;
    }
    
    [dict release];
}

%end

CGPoint touchLocation;

%hook SBIconView

- (BOOL)iconPositionIsEditable:(id)arg1 
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	return YES;
    }
    else
    {
	return %orig;
    }
    
    [dict release];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	UITouch *touch = [[event allTouches] anyObject]; 
	touchLocation = [touch locationInView:self]; 
	if (!onIcon) %orig;
    }
    else
    {
	%orig;
    }
    
    [dict release];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	if (onIcon) 
	{ 
	    isDragging = YES; 
	    UITouch *touch = [touches anyObject];
	    CGPoint touchLocation2 = [touch locationInView:self]; 

	    if ([[dict objectForKey:@"SlideDownAct"] intValue] != 3)
	    {
		if (onIcon.frame.origin.y + touchLocation2.y - touchLocation.y > ICONPOS) 
		{
		    if ([[dict objectForKey:@"SlideDownAct"] intValue] == 1)
		    {
			onIcon.frame = CGRectMake(onIcon.frame.origin.x,onIcon.frame.origin.y + touchLocation2.y - touchLocation.y,onIcon.frame.size.width,onIcon.frame.size.height); 
			onIcon.alpha = (100 - onIcon.frame.origin.y + touchLocation2.y - touchLocation.y)/(100 - ICONPOS); 
		    }

		    if ([[dict objectForKey:@"SlideDownAct"] intValue] == 0)
		    {
			SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];

			if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
			{
			    NSArray *identifiers = [switcher _bundleIdentifiersForViewDisplay];
	    
			    SBAppSwitcherBarView *barView = MSHookIvar<SBAppSwitcherBarView *>(switcher, "_bottomBar");

			    for (NSString *identifier in identifiers) 
			    {
				SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
				SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];

				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,iconView.frame.origin.y + touchLocation2.y - touchLocation.y,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = (100 - iconView.frame.origin.y + touchLocation2.y - touchLocation.y)/(100 - ICONPOS); 
				}
			    }
			}
			else
			{
			    NSArray *icons = [switcher _applicationIconsExceptTopApp];
		    
			    for (SBIconView *iconView in icons) 
			    {
				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,iconView.frame.origin.y + touchLocation2.y - touchLocation.y,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = (100 - iconView.frame.origin.y + touchLocation2.y - touchLocation.y)/(100 - ICONPOS); 
				}
			    }
			}
		    }
		}
	   }

	   if ([[dict objectForKey:@"SlideUpAct"] intValue] != 3)     
	   { 
		if (onIcon.frame.origin.y + touchLocation2.y - touchLocation.y < ICONPOS) 
		{
		    if ([[dict objectForKey:@"SlideUpAct"] intValue] == 1)
		    {
			onIcon.frame = CGRectMake(onIcon.frame.origin.x,onIcon.frame.origin.y + touchLocation2.y - touchLocation.y,onIcon.frame.size.width,onIcon.frame.size.height); 
			onIcon.alpha = (100 - onIcon.frame.origin.y + touchLocation2.y - touchLocation.y)/(100 - ICONPOS); 
		    }

		    if ([[dict objectForKey:@"SlideUpAct"] intValue] == 0)
		    {
			SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];
    
			if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
			{
			    NSArray *identifiers = [switcher _bundleIdentifiersForViewDisplay];
	      
			    SBAppSwitcherBarView *barView = MSHookIvar<SBAppSwitcherBarView *>(switcher, "_bottomBar");

			    for (NSString *identifier in identifiers) 
			    {
				SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
				SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];

				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,iconView.frame.origin.y + touchLocation2.y - touchLocation.y,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = (100 - iconView.frame.origin.y + touchLocation2.y - touchLocation.y)/(100 - ICONPOS); 
				}
			    }
			}
			else
			{
			    NSArray *icons = [switcher _applicationIconsExceptTopApp];
		      
			    for (SBIconView *iconView in icons) 
			    {
				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,iconView.frame.origin.y + touchLocation2.y - touchLocation.y,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = (100 - iconView.frame.origin.y + touchLocation2.y - touchLocation.y)/(100 - ICONPOS); 
				}
			    }
			}
		    }
		}
	    }
	    
	    float senseDown = [[dict objectForKey:@"SlideDownSen"] floatValue];
	    float senseUp = [[dict objectForKey:@"SlideUpSen"] floatValue];

	    if (onIcon.frame.origin.y > senseDown + ICONPOS) 
	    { 
		if ([[dict objectForKey:@"SlideDownAct"] intValue] == 0) killAllIcons = YES;
		if ([[dict objectForKey:@"SlideDownAct"] intValue] == 1) killIcon = YES; 
	    } 

	    if (onIcon.frame.origin.y < -senseUp + ICONPOS)
	    {
		if ([[dict objectForKey:@"SlideUpAct"] intValue] == 0) killAllIcons = YES;
		if ([[dict objectForKey:@"SlideUpAct"] intValue] == 1) killIcon = YES;
	    }
	    
	} 
	else 
	{ 
	    %orig; 
	}
    }
    else
    {
	%orig;
    }
    
    [dict release];
    
}

-(void)touchesEnded:(id)ended withEvent:(id)event
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	if (!onIcon)
	{
	    %orig;
	}
	else
	{
	    if ((onIcon.frame.origin.y == ICONPOS) && (!killAll))
	    {
		%orig;
	    
	    }
	    else
	    {
	    
		if (!killIcon)
		{
		    if (!killAllIcons)
		    {
			onIcon.frame = CGRectMake(onIcon.frame.origin.x,ICONPOS,onIcon.frame.size.width,onIcon.frame.size.height);
			onIcon.alpha = 1.0f;
		    }
		}
		else
		{
		
		    SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];	 
		    if (onIcon) 	   
			[switcher iconCloseBoxTapped:onIcon];
		    killIcon = NO;
		}

		SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];

		if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
		{
		    NSArray *identifiers = [switcher _bundleIdentifiersForViewDisplay]; 	   
		    SBAppSwitcherBarView *barView = MSHookIvar<SBAppSwitcherBarView *>(switcher, "_bottomBar");

		    if (!killAllIcons)
		    {
			if (!killIcon)
			{
			    for (NSString *identifier in identifiers) 
			    {
				SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
				SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];
  
				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,ICONPOS,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = 1.0f; 
				}
			    }
			}
		    }
		    else
		    {
			for (NSString *identifier in identifiers) 
			{
			    SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
			    SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];
  
			    if (iconView) 
			    {
				[switcher iconCloseBoxTapped:iconView];
			    }
			    iconView = nil;
			}
		    }
		}
		else
		{
		    if (!killAllIcons)
		    {
			if (!killIcon)
			{
			    NSArray *icons = [switcher _applicationIconsExceptTopApp];
		    
			    for (SBIconView *iconView in icons) 
			    {
				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,ICONPOS,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = 1.0f; 
				}
			    }
			}		    
		    }
		    else
		    {
			NSArray *icons = [switcher _applicationIconsExceptTopApp];
		    
			for (SBIconView *iconView in icons) 
			{
			    if (iconView) 
			    {
				[switcher iconCloseBoxTapped:iconView];
			    }
			}

			SBUIController *uiCont = [%c(SBUIController) sharedInstance];			    
			[uiCont dismissSwitcherAnimated:YES];						     
								       
		    }
		}
		killAllIcons = NO;
		killAll = NO;
	    }
	    onIcon = nil;	 
	}
	isDragging = NO;
    }
    else
    {
	%orig;
    }
    
    [dict release];
    
}

-(void)touchesCancelled:(id)cancelled withEvent:(id)event
{
    /*
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	if (!onIcon)
	{
	    %orig;
	}
	else
	{
	    
	    onIcon.frame = CGRectMake(onIcon.frame.origin.x,ICONPOS,onIcon.frame.size.width,onIcon.frame.size.height);
	    onIcon.alpha = 1.0f;
	    
	    SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];

	    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
	    {
		NSArray *identifiers = [switcher _bundleIdentifiersForViewDisplay];
	    
		SBAppSwitcherBarView *barView = MSHookIvar<SBAppSwitcherBarView *>(switcher, "_bottomBar");

		for (NSString *identifier in identifiers) 
		{
		    SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
		    SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];

		    if ((iconView) && (iconView != onIcon)) 
		    {
			iconView.frame = CGRectMake(iconView.frame.origin.x,ICONPOS,iconView.frame.size.width,iconView.frame.size.height);
			iconView.alpha = 1.0f; 
		    }
		}
	    }
	    else
	    {
		NSArray *icons = [switcher _applicationIconsExceptTopApp];
		    
		for (SBIconView *iconView in icons) 
		{
		    if ((iconView) && (iconView != onIcon)) 
		    {
			iconView.frame = CGRectMake(iconView.frame.origin.x,ICONPOS,iconView.frame.size.width,iconView.frame.size.height);
			iconView.alpha = 1.0f; 
		    }
		}
	    }
	    onIcon = nil;
	    isDragging = NO;
	    %orig;
	}
    }
    else
    {
	%orig;
    }
    
    [dict release];
    */
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	if (!onIcon)
	{
	    %orig;
	}
	else
	{
	    if ((onIcon.frame.origin.y == ICONPOS) && (!killAll))
	    {
		%orig;
	    
	    }
	    else
	    {
	    
		if (!killIcon)
		{
		    if (!killAllIcons)
		    {
			onIcon.frame = CGRectMake(onIcon.frame.origin.x,ICONPOS,onIcon.frame.size.width,onIcon.frame.size.height);
			onIcon.alpha = 1.0f;
		    }
		}
		else
		{
		
		    SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];	 
		    if (onIcon) 	   
			[switcher iconCloseBoxTapped:onIcon];
		    killIcon = NO;
		}

		SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];

		if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
		{
		    NSArray *identifiers = [switcher _bundleIdentifiersForViewDisplay]; 	   
		    SBAppSwitcherBarView *barView = MSHookIvar<SBAppSwitcherBarView *>(switcher, "_bottomBar");

		    if (!killAllIcons)
		    {
			if (!killIcon)
			{
			    for (NSString *identifier in identifiers) 
			    {
				SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
				SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];
  
				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,ICONPOS,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = 1.0f; 
				}
			    }
			}
		    }
		    else
		    {
			for (NSString *identifier in identifiers) 
			{
			    SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
			    SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];
  
			    if (iconView) 
			    {
				[switcher iconCloseBoxTapped:iconView];
			    }
			    iconView = nil;
			}
		    }
		}
		else
		{
		    if (!killAllIcons)
		    {
			if (!killIcon)
			{
			    NSArray *icons = [switcher _applicationIconsExceptTopApp];
		    
			    for (SBIconView *iconView in icons) 
			    {
				if (iconView) 
				{
				    iconView.frame = CGRectMake(iconView.frame.origin.x,ICONPOS,iconView.frame.size.width,iconView.frame.size.height);
				    iconView.alpha = 1.0f; 
				}
			    }
			}		    
		    }
		    else
		    {
			NSArray *icons = [switcher _applicationIconsExceptTopApp];
		    
			for (SBIconView *iconView in icons) 
			{
			    if (iconView) 
			    {
				[switcher iconCloseBoxTapped:iconView];
			    }
			}

			SBUIController *uiCont = [%c(SBUIController) sharedInstance];			    
			[uiCont dismissSwitcherAnimated:YES];						     
								       
		    }
		}
		killAllIcons = NO;
		killAll = NO;
	    }
	    onIcon = nil;	 
	}
	isDragging = NO;
    }
    else
    {
	%orig;
    }
    
    [dict release];
}

-(void)cancelLongPressTimer
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	if (!onIcon)
	{
	    %orig;
	}
	
    }
    else
    {
	%orig;
    }
    
    [dict release];
    
}

-(void)longPressTimerFired
{
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.suu.slide2killsettings.plist"];

    if([[dict objectForKey:@"Enabled"] boolValue])
    {
	if (!onIcon)
	{
	    %orig;
	}
	else
	{
	    if ([[dict objectForKey:@"LongPressAct"] intValue] != 2)
	    {
		if (!isDragging)
		{
		    SBAppSwitcherController *switcher = [%c(SBAppSwitcherController) sharedInstance];

		    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
		    {
			NSArray *identifiers = [switcher _bundleIdentifiersForViewDisplay];
	    
			SBAppSwitcherBarView *barView = MSHookIvar<SBAppSwitcherBarView *>(switcher, "_bottomBar");

			for (NSString *identifier in identifiers) 
			{
			    SBIcon *icon = [barView _iconForDisplayIdentifier:identifier];
			    SBIconView *iconView = [barView _iconViewForIcon:icon creatingIfNecessary:YES];
 
			    if ((iconView) && (iconView != onIcon)) 
			    {
				[switcher iconCloseBoxTapped:iconView];
			    }
			    iconView = nil;
			}
		    }
		    else
		    {
			NSArray *icons = [switcher _applicationIconsExceptTopApp];
		    
			for (SBIconView *iconView in icons) 
			{
			    if ((iconView) && (iconView != onIcon)) 
			    {
				 [switcher iconCloseBoxTapped:iconView];
			    }
			    iconView = nil;
			}
		    }
		    SBUIController *uiCont = [%c(SBUIController) sharedInstance];			
			[uiCont dismissSwitcherAnimated:YES];						     
		    killAll = YES;
		    if ([[dict objectForKey:@"LongPressAct"] intValue] == 1) killIcon = NO;
		    if ([[dict objectForKey:@"LongPressAct"] intValue] == 0) killIcon = YES;
	     
		}
	    }		 
	}
    }
    else
    {
	%orig;
    }
    
    [dict release];
    
}

%end
//#import <Preferences/Preferences.h>
#import "PSListController.h"

@interface Slide2KillSettingsListController: PSListController {
}
@end

@implementation Slide2KillSettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Slide2KillSettings" target:self] retain];
	}
	return _specifiers;
}

- (void)followSina:(id)sender 
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.weibo.com/iamsuu"]];
}

- (void)followTwitter:(id)sender 
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/al1en_Suu"]];
}

- (void)openBlog:(id)sender 
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://iamsuu.lofter.com"]];
}

- (void)donate:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=3255805@qq.com&lc=GB&item_name=Slide2Kill&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted"]];
}

@end

// vim:ft=objc

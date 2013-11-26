/**
 * This header is generated by class-dump-z 0.2-0.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: (null)
 */

/*#import </libobjc.A.h>
#import "SpringBoard-Structs.h"
#import "UIWindowDelegate.h"
#import "SBShowcaseControllerOwner.h"
*/
@class SBWallpaperView, UIView, SBSwitchAppGestureView, SBWallpaper, SBDismissOnlyAlertItem, UIStatusBar, SBUIRootView, UIWindow, UIStatusBarCorners, NSMutableDictionary, NSArray, SBApplication, SBAnimationStepper, SBWorkspaceEventQueueLockAssertion, NSMutableArray, SBShowcaseController;

__attribute__((visibility("hidden")))
@interface SBUIController : NSObject /*<UIWindowDelegate, SBShowcaseControllerOwner>*/ {
	UIWindow* _window;
	UIView* _iconsView;
	SBUIRootView* _rootView;
	UIView* _contentView;
	SBWallpaper* _wallpaper;
	SBWallpaperView* _wallpaperView;
	UIStatusBar* _fakeSpringBoardStatusBar;
	UIStatusBarCorners* _fakeTopCorners;
	SBShowcaseController* _showcaseController;
	SBApplication* _showcaseHostedApp;
	SBApplication* _toggleSwitcherAfterLaunchApp;
	NSMutableArray* _showcaseDismissCompletionBlocks;
	BOOL _showcaseDismissAnimationInProgress;
	unsigned _rootViewHidden : 1;
	unsigned _ignoringEvents : 1;
	unsigned _lastVolumeDownToControl : 1;
	unsigned _isBatteryCharging : 1;
	unsigned _isOnAC : 1;
	unsigned _connectedToUnusableFirewire : 1;
	unsigned _isConnectedToChargeIncapablePowerSource : 1;
	unsigned _allowAlertWindowRotation : 1;
	id _volumeHandler;
	float _batteryCapacity;
	float _curvedBatteryCapacity;
	int _batteryLoggingStartCapacity;
	SBDismissOnlyAlertItem* _fwChargingAlert;
	NSMutableDictionary* _installedSystemGestureViews;
	SBAnimationStepper* _suspendAnimationStepper;
	SBAnimationStepper* _statusBarAnimationStepper;
	id _suspendGestureCompleteForwardToEndHandler;
	id _suspendGestureCompleteBackwardToStartHandler;
	BOOL _switcherVisibleWhenSuspendGestureStarted;
	SBWorkspaceEventQueueLockAssertion* _suspendGestureWorkspaceLock;
	BOOL _switcherAnimationRevealing;
	BOOL _switcherAnimationInProgress;
	BOOL _switcherGestureRevealedOrDismissedSwitcher;
	SBSwitchAppGestureView* _switchAppGestureView;
	float _switchAppGesturePreviousPercentage;
	float _switchAppGestureEffectivePercentage;
	unsigned _switchAppGestureChangedFrames;
	UIView* _systemGestureBackdrop;
	UIView* _pendingGestureLaunchView;
	SBApplication* _pendingAppActivatedByGesture;
	SBApplication* _appCurrentlyActivatingByGesture;
	NSMutableArray* _switchAppFullyOrderedList;
	NSArray* _switchAppFilteredList;
	unsigned _switchAppGestureStatusBarMaintenanceBits;
	BOOL _switchAppGestureStatusBarMaintained;
	BOOL _switcherVisibleWhenSwitchAppGestureStarted;
	BOOL _toggleSwitcherAfterLaunchAppUsesSystemGestureOrientation;
	BOOL _keyboardNeedsShowcaseTranslation;
	BOOL _unprocessedKeyboardOrientationChangeForShowcase;
	BOOL _showNotificationsGestureIsShowingTab;
}
//@property(retain, nonatomic) SBShowcaseController* showcaseController;
+(id)sharedInstanceIfExists;
+(id)sharedInstance;
+(int)displayedLevelForLockScreenBatteryLevel:(int)lockScreenBatteryLevel;
+(CGAffineTransform)_transformAndFrame:(CGRect*)frame forStatusBarWithOrientation:(int)orientation height:(float)height inJailRect:(CGRect)jailRect;
+(id)_zoomViewWithIOSurfaceSnapshotOfApp:(id)app includeStatusBar:(BOOL)bar includeBanner:(BOOL)banner;
+(id)zoomViewForContextHostView:(id)contextHostView application:(id)application includeStatusBar:(BOOL)bar includeBanner:(BOOL)banner;
+(id)zoomViewForApplication:(id)application includeStatusBar:(BOOL)bar includeBanner:(BOOL)banner includeRoundedCorners:(BOOL)corners canUseIOSurface:(BOOL)surface decodeImage:(BOOL)image;
+(void)_setRoundedCornersOnZoomLayerIfNecessary:(id)necessary forApp:(id)app withCornersFrame:(CGRect)cornersFrame;
+(id)_zoomViewForApplication:(id)application interfaceOrientation:(int)orientation includeStatusBar:(BOOL)bar includeBanner:(BOOL)banner snapshotFrame:(CGRect*)frame canUseIOSurface:(BOOL)surface decodeImage:(BOOL)image;
+(CGRect)snapshotRectForOrientation:(int)orientation statusBarStyle:(int)style hidden:(BOOL)hidden;
-(void)cleanupSwitchAppGestureStatusBar;
-(BOOL)_switchAppGestureStatusBarMaintained;
-(void)updateSwitchAppGestureStatusBar;
-(void)prepareSwitchAppGestureStatusBar;
-(void)_makeSwitchAppGestureFakeStatusBarVisible;
-(void)_dismissBannerGestureEndedWithCompletionType:(int)completionType;
-(void)_hideNotificationsGestureCancelled;
-(void)_hideNotificationsGestureEndedWithCompletionType:(int)completionType velocity:(CGPoint)velocity;
-(void)_hideNotificationsGestureChanged:(float)changed;
-(void)_hideNotificationsGestureBegan:(float)began;
-(void)_hideNotificationCenterTabControl;
-(float)showNotificationsTabControlSwipableWidth;
-(BOOL)isShowingNotificationCenterTabControl;
-(BOOL)shouldShowNotificationCenterTabControlOnFirstSwipe;
-(void)updateShouldShowNotificationCenterTabControlOnFirstSwipe;
-(void)_showNotificationsGestureCancelled;
-(void)_showNotificationsGestureFailed;
-(void)_showNotificationsGestureEndedWithLocation:(CGPoint)location velocity:(CGPoint)velocity;
-(void)_showNotificationsGestureChangedWithLocation:(CGPoint)location velocity:(CGPoint)velocity;
-(void)_showNotificationsGestureBeganWithLocation:(CGPoint)location;
-(void)_switchAppGestureViewAnimationComplete;
-(void)_installSwitchAppGesturePlaceholderViewForEndingApp:(id)endingApp;
-(void)launchApplicationByGesture:(id)gesture;
-(void)launchPendingAppActivatedByGestureIfExists;
-(void)scheduleApplicationForLaunchByGesture:(id)launchByGesture;
-(void)_clearPendingAppActivatedByGesture:(BOOL)gesture;
-(void)clearPendingAppActivatedByGesture;
-(BOOL)hasPendingAppActivatedByGesture;
-(void)cleanupSwitchAppGestureViews;
-(void)programmaticSwitchAppGestureMoveToRight;
-(void)programmaticSwitchAppGestureMoveToLeft;
-(void)programmaticSwitchAppGestureApplyWithPercentage:(float)percentage;
-(void)_switchAppGestureCancelled;
-(void)_switchAppGestureEndedWithCompletionType:(int)completionType cumulativePercentage:(float)percentage;
-(void)_switchAppGestureChanged:(float)changed;
-(void)_switchAppGestureBegan:(float)began;
-(void)prefetchAdjacentAppsAndEvictRemotes:(id)remotes;
-(void)_clearGestureViewVendorCacheForAppWithDisplayIdenitifier:(id)displayIdenitifier;
-(id)_makeSwitchAppFilteredList:(id)list initialApp:(id)app;
-(void)_getSwitchAppPrefetchApps:(id)apps initialApp:(id)app outLeftwardAppIdentifier:(id*)identifier outRightwardAppIdentifier:(id*)identifier4;
-(id)_makeSwitchAppValidList:(id)list;
-(void)removeAppFromSwitchAppList:(id)switchAppList;
-(void)_clearSwitchAppList;
-(id)_calculateSwitchAppList;
-(void)_animateStatusBarForSuspendGesture;
-(void)_addFakeCornersForSuspendGestureIfNeededForApp:(id)app cornerAlignment:(int)alignment;
-(void)_suspendGestureCleanUpState;
-(void)_suspendGestureCancelled;
-(void)_suspendGestureEndedWithCompletionType:(int)completionType;
-(BOOL)_suspendGestureShouldFinish;
-(void)_suspendGestureChanged:(float)changed;
-(void)_suspendGestureBegan;
-(void)_switcherGestureCancelled;
-(void)_switcherGestureEndedWithCompletionType:(int)completionType cumulativePercentage:(float)percentage;
-(void)_switcherGestureChanged:(float)changed;
-(void)_switcherGestureBegan;
-(BOOL)_switcherGestureIsBlockedByAppLaunchOrIgnoringEvents;
-(void)cleanupRunningGestureIfNeeded;
-(void)animationStepperFinishBackwardToStartCompleted:(id)startCompleted;
-(BOOL)shouldSendTouchesToSystemGestures;
-(void)notifyAppResumeActive:(id)active;
-(void)notifyAppResignActive:(id)active;
-(void)handleDismissBannerSystemGesture:(id)gesture;
-(void)handleHideNotificationsSystemGesture:(id)gesture;
-(void)handleShowNotificationsSystemGesture:(id)gesture;
-(void)handleFluidVerticalSystemGesture:(id)gesture;
-(void)handleFluidHorizontalSystemGesture:(id)gesture;
-(void)handleFluidScaleSystemGesture:(id)gesture;
-(void)hideSystemGestureBackdrop;
-(void)showSystemGestureBackdrop;
-(id)systemGestureSnapshotForApp:(id)app includeStatusBar:(BOOL)bar decodeImage:(BOOL)image;
-(id)systemGestureSnapshotWithIOSurfaceSnapshotOfApp:(id)app includeStatusBar:(BOOL)bar;
-(id)systemGestureSnapshotOfSwitcher;
-(void)_installSystemGestureView:(id)view forKey:(id)key forGesture:(unsigned)gesture;
-(void)_clearAllInstalledSystemGestureViews;
-(void)_clearInstalledSystemGestureViewForKey:(id)key;
-(id)_installedSystemGestureViewForKey:(id)key;
-(id)_systemGestureViewKeyForApp:(id)app;
-(void)animationDidStop:(id)animation finished:(BOOL)finished;
-(unsigned char)headsetBatteryCapacity;
-(BOOL)isHeadsetBatteryCharging;
-(BOOL)isHeadsetDocked;
-(void)activeInterfaceOrientationDidChangeToOrientation:(int)activeInterfaceOrientation willAnimateWithDuration:(double)duration fromOrientation:(int)orientation;
-(void)activeInterfaceOrientationWillChangeToOrientation:(int)activeInterfaceOrientation;
-(void)window:(id)window didRotateFromInterfaceOrientation:(int)interfaceOrientation;
-(void)window:(id)window willAnimateRotationToInterfaceOrientation:(int)interfaceOrientation duration:(double)duration;
-(void)window:(id)window willRotateToInterfaceOrientation:(int)interfaceOrientation duration:(double)duration;
-(id)rotatingFooterViewForWindow:(id)window;
-(id)rotatingContentViewForWindow:(id)window;
-(BOOL)window:(id)window shouldAutorotateToInterfaceOrientation:(int)interfaceOrientation;
-(BOOL)shouldWindowUseOnePartInterfaceRotationAnimation:(id)animation;
-(void)showcase:(id)showcase didTransferOwnershipToOwner:(id)owner;
-(void)assumeShowcaseOwnership:(id)ownership;
-(float)showcaseWindowLevel:(id)level;
-(void)showcaseWantsToBeDismissed:(id)beDismissed animated:(BOOL)animated;
-(void)showcase:(id)showcase updateRevealMode:(int)mode withBlock:(id)block;
-(BOOL)presentShowcaseViewController:(id)controller revealMode:(int)mode completion:(id)completion;
-(void)noteStatusBarHeightChanged:(id)changed;
-(BOOL)isConnectedToUnusableFirewireCharger;
-(void)setIsConnectedToUnusableFirewireCharger:(BOOL)unusableFirewireCharger;
-(void)ACPowerChanged;
-(BOOL)isConnectedToChargeIncapablePowerSource;
-(BOOL)isOnAC;
-(BOOL)isBatteryCharging;
-(int)displayBatteryCapacityAsPercentage;
-(int)curvedBatteryCapacityAsPercentage;
-(float)curvedBatteryCapacity;
-(int)batteryCapacityAsPercentage;
-(float)batteryCapacity;
-(void)updateBatteryState:(id)state;
-(void)cancelVolumeEvent;
//-(void)handleVolumeEvent:(GSEventRef)event;
-(float)_contentRotationForOrientation:(int)orientation;
-(CGAffineTransform)_portraitViewTransformForSwitcherSize:(CGSize)switcherSize orientation:(int)orientation;
-(BOOL)_ignoringEvents;
-(void)_resumeEventsIfNecessary;
-(void)_ignoreEvents;
-(void)_showcaseBlockingViewHit:(id)hit;
-(BOOL)allowAlertWindowRotation;
-(BOOL)isSwitcherShowing;
-(BOOL)isShowcaseShowing;
-(void)_unhostSwitcherAppImmediatelyAndHideForSuspend:(BOOL)suspend;
-(void)_dismissShowcase:(double)showcase;
-(void)removePrintTransitionView:(id)view;
-(void)addPrintTransitionView:(id)view;
-(void)dismissSwitcherWithoutUnhostingApp;
-(void)dismissAssistantAnimated:(BOOL)animated;
-(void)dismissSwitcherAnimated:(BOOL)animated;
-(void)dismissShowcaseForAlert:(id)alert;
-(void)_adjustViewHierarchyForShowcase:(id)showcase withContext:(id)context;
-(void)_adjustAlertViewHierarchyForShowcaseContext:(id)showcaseContext;
-(id)_showcaseContextForOffset:(float)offset;
-(BOOL)showcaseExpectsFaceContact;
-(void)openNewsstand;
-(void)_dismissShowcase:(double)showcase unhost:(BOOL)unhost completionBlock:(id)block;
-(void)_dismissShowcase:(double)showcase unhost:(BOOL)unhost;
-(void)dismissShowcaseAnimated:(BOOL)animated withCompletionBlock:(id)completionBlock;
-(BOOL)_revealShowcase:(id)showcase revealMode:(int)mode duration:(double)duration fromSystemGesture:(BOOL)systemGesture revealSetupBlock:(id)block;
-(void)_revealShowcaseCore:(id)core revealMode:(int)mode duration:(double)duration fromSystemGesture:(BOOL)systemGesture revealSetupBlock:(id)block;
-(void)_prepareShowcaseAndHierarchy:(id)hierarchy withContext:(id)context ghostly:(BOOL)ghostly hostApp:(id)app;
-(id)_showcaseHostedApp;
-(void)_keyboardWillShow:(id)_keyboard;
-(void)_translateKeyboardWindowByOffset:(float)offset forShowcase:(id)showcase;
-(void)textEffectsWindowRotated:(id)rotated;
-(BOOL)activateSwitcher;
-(BOOL)_activateSwitcher:(double)switcher;
-(BOOL)_activateSwitcher:(double)switcher fromSystemGesture:(BOOL)systemGesture;
-(BOOL)_canActivateShowcaseIgnoringTouches:(BOOL)touches;
-(void)_accessibilityWillBeginAppSwitcherRevealAnimation;
-(float)_appSwitcherRevealAnimationDelay;
-(BOOL)handleMenuDoubleTap;
-(void)_toggleSwitcher;
-(void)_setToggleSwitcherAfterLaunchApp:(id)app;
-(id)_toggleSwitcherAfterLaunchApp;
-(void)_awayControllerActivated:(id)activated;
-(void)_applicationActivationStateDidChange:(id)_applicationActivationState;
-(void)_noteAppDidFailToActivate:(id)_noteApp;
-(void)_noteAppDidActivate:(id)_noteApp;
-(BOOL)clickedMenuButton;
-(BOOL)_handleButtonEventToSuspendDisplays:(BOOL)suspendDisplays displayWasSuspendedOut:(BOOL*)anOut;
-(int)_dismissSheetsAndDetermineAlertStateForMenuClickOrSystemGesture;
-(void)finishedUnscattering;
-(void)zoomWallpaper:(BOOL)wallpaper delay:(double)delay duration:(double)duration;
-(void)stopRestoringIconList;
-(id)_snapshotUIAndUnhostForSwitcher:(id)switcher;
-(void)tearDownIconListAndBar;
-(void)restoreIconListForSuspendGesture;
-(void)restoreIconListAnimated:(BOOL)animated delay:(double)delay animateWallpaper:(BOOL)wallpaper keepSwitcher:(BOOL)switcher;
-(void)restoreIconListAnimated:(BOOL)animated animateWallpaper:(BOOL)wallpaper keepSwitcher:(BOOL)switcher;
-(void)restoreIconListAnimated:(BOOL)animated animateWallpaper:(BOOL)wallpaper;
-(void)restoreIconListAnimatedIfNeeded:(BOOL)needed animateWallpaper:(BOOL)wallpaper;
-(void)restoreIconListAnimated:(BOOL)animated delay:(double)delay;
-(void)restoreIconListAnimated:(BOOL)animated;
-(void)_closeOpenFolderIfNecessary;
-(BOOL)isRootViewHidden;
-(void)_hideKeyboard;
-(void)setRootViewHiddenForScatter:(BOOL)scatter duration:(double)duration delay:(double)delay additionalAnimations:(id)animations completion:(id)completion;
-(void)setRootViewHiddenForScatter:(BOOL)scatter duration:(double)duration delay:(double)delay completion:(id)completion;
-(void)setRootViewHiddenForScatter:(BOOL)scatter duration:(double)duration delay:(double)delay;
-(void)fadeIconsForScatter:(BOOL)scatter duration:(double)duration delay:(double)delay;
-(void)scatterIconListAndBar:(BOOL)bar fade:(BOOL)fade animateWallpaper:(BOOL)wallpaper;
-(void)scatterIconListAndBar:(BOOL)bar;
-(void)_deviceLockStateChanged:(id)changed;
-(void)_airPlayPasswordAlertWillAppear:(id)_airPlayPasswordAlert;
-(void)_releaseTransitionOrientationLock;
-(void)_releaseSystemGestureOrientationLock;
-(void)releaseSwitcherOrientationLockUnlessPrintViewIsShowing;
-(void)_lockOrientationForSystemGesture;
-(void)_lockOrientationForTransition;
-(void)activateURLFromBulletinList:(id)bulletinList;
-(void)activateApplicationFromSwitcher:(id)switcher;
-(void)activateApplicationAnimated:(id)animated;
-(void)launchIcon:(id)icon;
-(BOOL)isDisplayingWallpaper;
-(id)wallpaperView;
-(void)setShouldRasterizeAndFreezeContentView:(BOOL)rasterizeAndFreezeContentView;
-(id)window;
-(id)contentView;
-(id)rootView;
-(void)setFakeTopCornersVisible:(BOOL)visible;
-(void)setFakeSpringBoardStatusBarVisible:(BOOL)visible;
-(void)clearFakeSpringBoardStatusBarAndCorners;
-(void)createFakeTopCornersOfStyle:(int)style;
-(void)createFakeSpringBoardStatusBar;
-(id)_fakeSpringBoardStatusBar;
-(void)cleanUpOnFrontLocked;
-(BOOL)promptUnlockForAppActivation:(id)appActivation withCompletion:(id)completion;
-(void)lockFromSource:(int)source disconnectingCallIfNecessary:(BOOL)necessary;
-(void)lockFromSource:(int)source;
-(void)systemControllerRouteChanged:(id)changed;
-(void)finishLaunching;
-(void)animateAppleDown:(BOOL)down;
-(id)init;
-(void)dealloc;
-(void)_indicateConnectedToPower;
@end


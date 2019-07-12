
#include "AppDelegate.h"
#import <Flutter/Flutter.h>
#import "GeneratedPluginRegistrant.h"
#import "NativeViewController.h"


@interface AppDelegate()
	@property (nonatomic, strong) UINavigationController *navigationController;
@end


@implementation AppDelegate
- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
	
	[GeneratedPluginRegistrant registerWithRegistry:self];

	//将flutter view 作为根视图

	FlutterViewController *controller = (FlutterViewController*)self.window.rootViewController;
	
	
	//set up navigation stack
	self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = self.navigationController;
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	[self.window makeKeyAndVisible];
	
	
	//交流接口
	
	FlutterMethodChannel* testChannel = [FlutterMethodChannel
											methodChannelWithName:@"samples.flutter.dev/goToNativePage"
											binaryMessenger:controller];
	
	[testChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
		
		NSLog(@"%@", call.method);
		
		
		//接收从flutter传递过来的参数
		NSLog(@"%@", call.arguments[@"test"]);
		
		
		if ([@"goToNativePage" isEqualToString:call.method]) {
			NSString * storyboardName = @"Main";
			UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
			UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"NativeViewController"];
			vc.navigationItem.title = call.arguments[@"test"];

			[self.navigationController pushViewController:vc animated:true];

		} else {
			result(FlutterMethodNotImplemented);
		}
	}];
	
	
	return [super application:application didFinishLaunchingWithOptions:launchOptions];
	// return true;
}

@end


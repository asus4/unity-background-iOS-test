#import "UnityAppController.h"
#import <AVFoundation/AVFoundation.h>

#import "UnityAppController+Rendering.h"

// This overrides the default UnityAppController
// https://forum.unity.com/threads/continue-running-app-in-background-for-audio-generation-ios.110512/

@interface BatchRenererAppController : UnityAppController {
  NSTimer *batchLoopTimer;
  UIBackgroundTaskIdentifier bgid;
}
@end

@implementation BatchRenererAppController

- (void)startUnity:(UIApplication *)application {
  [super startUnity:application];

  // Initialize AirPlay mode
  // https://forum.unity.com/threads/how-do-i-get-the-audio-running-in-background-ios.319602/
  [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback
                                         error:nil];
  [[AVAudioSession sharedInstance] setActive:YES error:nil];
  [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  //  [super applicationWillResignActive:application];
  NSLog(@"[BatchRenererAppController applicationWillResignActive]");
  batchLoopTimer =
      [NSTimer scheduledTimerWithTimeInterval:0.1
                                       target:self
                                     selector:@selector(backgroundUpdate)
                                     userInfo:nil
                                      repeats:YES];

  // Start background task
  UIApplication *app = UIApplication.sharedApplication;
  bgid = [app beginBackgroundTaskWithExpirationHandler:^{
    [app endBackgroundTask:bgid];
    bgid = UIBackgroundTaskInvalid;
  }];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  [super applicationDidBecomeActive:application];
  NSLog(@"[BatchRenererAppController applicationDidBecomeActive]");

  // End background task
  [batchLoopTimer invalidate];
  [UIApplication.sharedApplication endBackgroundTask:bgid];
}

- (void)backgroundUpdate {
  NSLog(@"Background Update");
  //    [self repaint];
  [self repaintDisplayLink];
}

@end

IMPL_APP_CONTROLLER_SUBCLASS(BatchRenererAppController)

//
//  SettingsViewController.m
//  Sunset
//
//  Created by Nathan Ansel on 5/19/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (IBAction)dismissSettingsView:(id)sender {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshView"
                                                      object:nil];
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeNotificationSetting:(id)sender {
  [self checkNotifications];
  
  if ([notificationSetting isOn]) {
    [myDefaults setObject:@"YES" forKey:@"notificationSetting"];
    [myDefaults synchronize];
  } else {
    [myDefaults setObject:@"NO" forKey:@"notificationSetting"];
    [myDefaults synchronize];
  }
}

- (void)checkNotifications {
  if(![self notificationsEnabled]) {
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:@"You have notifications disabled. Please turn them on in Settings.app and try again."
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
    notificationSetting.on = NO;
    [errorAlert show];
  }
}

- (BOOL)notificationsEnabled {
  UIUserNotificationSettings *noticationSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
  
  if (!noticationSettings || (noticationSettings.types == UIUserNotificationTypeNone)) {
    return NO;
  }
  return YES;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
  
  myDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.nathanchase.sunset"];
  
  if ([myDefaults objectForKey:@"notificationSetting"] == nil) {
    [myDefaults setObject:@"NO" forKey:@"notificationSetting"];
    [myDefaults synchronize];
  }
  
  notificationSetting.on = [[myDefaults objectForKey:@"notificationSetting"] boolValue];
  
  latitide.text = [NSString stringWithFormat:@"Lat: %.5f", [[myDefaults objectForKey:@"lat"] doubleValue]];
  longitude.text = [NSString stringWithFormat:@"Long: %.5f", [[myDefaults objectForKey:@"long"] doubleValue]];
  notificationTime.text = [NSString stringWithFormat:@"%d", stepper.value];
  
  if(![self notificationsEnabled]) {
    notificationSetting.on = NO;
  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperChange:(id)sender {
  notificationTime.text = [NSString stringWithFormat:@"%d", stepper.value];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

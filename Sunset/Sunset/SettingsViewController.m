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
  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeNoticicationSetting:(id)sender {
  if ([notificationSetting isOn]) {
    [myDefaults setObject:@"YES" forKey:@"notificationSetting"];
    [myDefaults synchronize];
  } else {
    [myDefaults setObject:@"NO" forKey:@"notificationSetting"];
    [myDefaults synchronize];
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  myDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.nathanchase.sunset"];
  
  if ([myDefaults objectForKey:@"notificationSetting"] == nil) {
    [myDefaults setObject:@"NO" forKey:@"notificationSetting"];
    [myDefaults synchronize];
  }
  notificationSetting.on = [[myDefaults objectForKey:@"notificationSetting"] boolValue];
  
//  ViewController *viewController = (ViewController *)self.window.rootViewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

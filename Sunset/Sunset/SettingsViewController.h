//
//  SettingsViewController.h
//  Sunset
//
//  Created by Nathan Ansel on 5/19/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController {
  IBOutlet UISwitch *notificationSetting;
  IBOutlet UILabel *latitide;
  IBOutlet UILabel *longitude;
  NSUserDefaults *myDefaults;
}

- (IBAction)dismissSettingsView:(id)sender;
- (IBAction)changeNotificationSetting:(id)sender;
- (void)checkNotifications;
- (BOOL)notificationsEnabled;

@end

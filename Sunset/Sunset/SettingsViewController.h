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
  IBOutlet UILabel *notificationTime;
  IBOutlet UIStepper *stepper;
  NSUserDefaults *myDefaults;
}

- (IBAction)dismissSettingsView:(id)sender;
- (IBAction)changeNotificationSetting:(id)sender;
- (IBAction)stepperChange:(id)sender;
- (void)checkNotifications;
- (BOOL)notificationsEnabled;
- (NSString *)makeStringFromMinuteInt: (int) minutes;
- (IBAction)bishopButton:(id)sender;

@end

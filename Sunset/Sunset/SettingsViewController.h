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
  NSUserDefaults *myDefaults;
}

- (IBAction)dismissSettingsView:(id)sender;
- (IBAction)changeNoticicationSetting:(id)sender;

@end

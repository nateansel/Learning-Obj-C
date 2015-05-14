//
//  TodayViewController.h
//  Sunset Widget
//
//  Created by Chase McCoy on 5/13/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
// #import "KosherCocoa.h"

@interface TodayViewController : UIViewController <CLLocationManagerDelegate> {
  IBOutlet UILabel *latLabel;
  IBOutlet UILabel *longLabel;
  IBOutlet UILabel *timeLabel;
  NSDate *sunrise;
  NSDate *sunset;
  NSUserDefaults *myDefaults;
  CLLocationManager *locationManager;
  CLLocation* location;
}

// - (void)getTimeOfSunset;
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations;
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
@end

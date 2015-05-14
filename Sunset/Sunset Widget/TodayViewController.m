//
//  TodayViewController.m
//  Sunset Widget
//
//  Created by Chase McCoy on 5/13/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

//- (void)getTimeOfSunset {
//  KCGeoLocation *currentLocation = [[KCGeoLocation alloc] initWithLatitude:location.coordinate.latitude andLongitude:location.coordinate.longitude andTimeZone:[NSTimeZone systemTimeZone]];
//  
//  KCAstronomicalCalendar *calendar = [[KCAstronomicalCalendar alloc] initWithLocation:currentLocation];
//  
//  // This was declared as an instance variable, but never allocated and inited
//  // does it need to be?
//  sunset = [calendar sunset];
//  NSDateFormatter *datFormatter = [[NSDateFormatter alloc] init];
//  [datFormatter setDateFormat:@"h:mm a"];
//  timeLabel.text = [datFormatter stringFromDate:sunset];
//}


- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
  // If it's a relatively recent event, turn off updates to save power.
  location = [locations lastObject];
  NSDate* eventDate = location.timestamp;
  NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
  if (fabs(howRecent) < 15.0) {
    // If the event is recent, do something with it.
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          location.coordinate.latitude,
          location.coordinate.longitude);
    // [self getTimeOfSunset];
    latLabel.text = [NSString stringWithFormat:@"Lat: %+.2f", location.coordinate.latitude];
    longLabel.text = [NSString stringWithFormat:@"Long: %+.2f", location.coordinate.longitude];
  }
  [locationManager stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@",error.description);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
  locationManager = [[CLLocationManager alloc] init];
  locationManager.delegate = self;
  locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
  locationManager.distanceFilter = 500; // meters
  [locationManager requestWhenInUseAuthorization];
  [locationManager startUpdatingLocation];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end

//
//  ViewController.m
//  Sunset
//
//  Created by Chase McCoy on 5/12/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (IBAction)getLocation:(id)sender {
  [locationManager startUpdatingLocation];
  [self getTimeOfSunset];
  [self getTimeUntilSunset];
}

- (void)getTimeOfSunset {
  KCGeoLocation *currentLocation = [[KCGeoLocation alloc] initWithLatitude:location.coordinate.latitude andLongitude:location.coordinate.longitude andTimeZone:[NSTimeZone systemTimeZone]];
  
  KCAstronomicalCalendar *calendar = [[KCAstronomicalCalendar alloc] initWithLocation:currentLocation];
  
  // This was declared as an instance variable, but never allocated and inited
  // does it need to be?
  sunset = [calendar sunset];
  NSDateFormatter *datFormatter = [[NSDateFormatter alloc] init];
  [datFormatter setDateFormat:@"h:mm a"];
  
  timeLabel.text = [datFormatter stringFromDate:sunset];
  
  [myDefaults setObject:[datFormatter stringFromDate:sunset] forKey:@"date"];
  [myDefaults synchronize];
}

- (void)getTimeUntilSunset {
  NSDate *currentTime = [NSDate date];
    NSTimeInterval timeBetweenDates = [sunset timeIntervalSinceDate:currentTime];
  double secondsInAnHour = 3600;
  double secondsInAMinute = 60;
  double hoursBetweenDates = timeBetweenDates / secondsInAnHour;
  double minutesBetweenDates = timeBetweenDates / secondsInAMinute;
  
  // UIColor *orangeColor = [UIColor colorWithRed:0.894 green:0.41 blue:0.041 alpha:1];
  // UIColor *blueColor = [UIColor colorWithRed:0.007 green:0.564 blue:1 alpha:1];
  
//  CAGradientLayer *currentLayer;
//  currentLayer = [CAGradientLayer layer];
//  currentLayer.frame = self.view.bounds;
//  [self.view.layer insertSublayer:currentLayer atIndex:0];
  
  if (hoursBetweenDates < 1.0 && hoursBetweenDates > 0.0) {
    isSet = NO;
    // Gradient
    orangeGradientLayer.hidden = false;
    blueGradientLayer.hidden = true;
    //
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    timeUntil.text = [NSString stringWithFormat:@"%.0f minutes of daylight left", minutesBetweenDates];
    willSet.text = @"the sun will set at";
    
    [myDefaults setObject:@"NO" forKey:@"isSet"];
    [myDefaults setObject:@"NO" forKey:@"inHours"];
    [myDefaults setObject:@"YES" forKey:@"inMinutes"];
    [myDefaults setObject:[NSString stringWithFormat:@"%.0f", minutesBetweenDates] forKey:@"minutes"];
    [myDefaults synchronize];
  }
  else if (hoursBetweenDates > 1.0) {
    isSet = NO;
    // Gradient
    orangeGradientLayer.hidden = false;
    blueGradientLayer.hidden = true;
    //
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    timeUntil.text = [NSString stringWithFormat:@"%.1f hours of daylight left", hoursBetweenDates];
    willSet.text = @"the sun will set at";
    
    [myDefaults setObject:@"NO" forKey:@"isSet"];
    [myDefaults setObject:@"YES" forKey:@"inHours"];
    [myDefaults setObject:@"No" forKey:@"inMinutes"];
    [myDefaults setObject:[NSString stringWithFormat:@"%.1f", hoursBetweenDates] forKey:@"hours"];
    [myDefaults synchronize];
  }
  else {
    isSet = YES;
    // Gradient
    orangeGradientLayer.hidden = true;
    blueGradientLayer.hidden = false;
    //
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    timeUntil.text = [NSString stringWithFormat:@"The sun has set"];
    willSet.text = @"the sun went down at";
    
    [myDefaults setObject:@"YES" forKey:@"isSet"];
    [myDefaults synchronize];
  }
}

- (void)setupGradients {
  orangeGradientLayer = [BackgroundLayer orangeGradient];
  blueGradientLayer = [BackgroundLayer blueGradient];
  orangeGradientLayer.frame = self.view.bounds;
  blueGradientLayer.frame = self.view.bounds;
  [self.view.layer insertSublayer:orangeGradientLayer atIndex:0];
  [self.view.layer insertSublayer:blueGradientLayer atIndex:1];
  
  blueGradientLayer.hidden = true;
  orangeGradientLayer.hidden = false;
}

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
    latLabel.text = [NSString stringWithFormat:@"Lat: %+.6f", location.coordinate.latitude];
    longLabel.text = [NSString stringWithFormat:@"Long: %+.5f", location.coordinate.longitude];
    [self getTimeOfSunset];
    [self getTimeUntilSunset];
  }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
  [errorAlert show];
  NSLog(@"Error: %@",error.description);
}

-(void) refresh {
  locationManager = [[CLLocationManager alloc] init];
  locationManager.delegate = self;
  locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
  locationManager.distanceFilter = 500; // meters
  [locationManager requestAlwaysAuthorization];
  [locationManager startUpdatingLocation];
}

-(void)stopLocation {
  [locationManager stopUpdatingLocation];
}

-(void)fetchNewDataWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
  [self refresh];
  [self stopLocation];
  completionHandler(UIBackgroundFetchResultNewData);
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  CALayer *btnLayer = [roundedButton layer];
  [btnLayer setMasksToBounds:YES];
  [btnLayer setCornerRadius:5.0f];
  
  myDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.nathanchase.sunset"];
  
  [self setupGradients];
  [self refresh];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end

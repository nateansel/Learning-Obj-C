//
//  SunEvent.m
//  Sunset
//
//  Created by Nathan Ansel on 5/15/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SunEvent.h"

@implementation SunEvent

- (SunEvent*)init {
  myDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.nathanchase.sunset"];
  [self updateLocation];
  return self;
}

- (void)locationManager:(CLLocationManager*) manager
        didUpdateLocations:(NSArray *)locations{
  currentLocation = [locations lastObject];
  if (fabs([currentLocation.timestamp timeIntervalSinceNow]) < 15.0) {
    currentGeoLocation = [[KCGeoLocation alloc] initWithLatitude:currentLocation.coordinate.latitude
                                                andLongitude:currentLocation.coordinate.longitude
                                                andTimeZone:[NSTimeZone systemTimeZone]];
    astronomicalCalendar = [[KCAstronomicalCalendar alloc] initWithLocation:currentGeoLocation];
  }
}

- (void)locationManager:(CLLocationManager*)manager
        didFailWithError:(NSError *)error {
  UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error"
                                                message:@"There was an error retrieving your location"
                                                delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
  // Display error message as a popup alert
  [errorAlert show];
  NSLog(@"Error: %@",error.description);
}

- (void)updateLocation {
  locationManager = [[CLLocationManager alloc] init];
  locationManager.delegate = self;
  locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
  locationManager.distanceFilter = 500; // meters
  [locationManager requestAlwaysAuthorization];
  [locationManager startUpdatingLocation];
}

- (NSDate*)getTodaySunsetDate {
  [astronomicalCalendar setWorkingDate:[NSDate date]];
  return [astronomicalCalendar sunset];
}

- (NSDate*)getTodaySunriseDate {
  [astronomicalCalendar setWorkingDate:[NSDate date]];
  return [astronomicalCalendar sunrise];
}

- (NSDate*)getTomorrowSunriseDate {
  [astronomicalCalendar setWorkingDate:[NSDate dateWithTimeIntervalSinceNow:86400]];
  return [astronomicalCalendar sunset];
}

- (NSString*)getRiseOrSetTimeString {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"h:mm a"];
  
  if (![self hasSunRisenToday]) {
    // the sun hasn't risen today
    return [NSString stringWithFormat:@"The sun will rise at %@",
            [dateFormatter stringFromDate:[self getTodaySunriseDate]]];
    
  } else if (![self hasSunSetToday]) {
    // the sun has not set today
    return [NSString stringWithFormat:@"The sun will set at %@",
            [dateFormatter stringFromDate:[self getTodaySunsetDate]]];
    
  } else {
    // the sun has already set today
    return [NSString stringWithFormat:@"The sun will rise at %@",
            [dateFormatter stringFromDate:[self getTomorrowSunriseDate]]];
  }
}

- (NSString*)getTimeLeftString: (NSDate*) date {
  // declare some variables
  double tempTimeNum;
  int hours, minutes;
  NSString *minuteString, *riseOrSet;
  
  tempTimeNum = [date timeIntervalSinceNow];  // the time difference between event and now in seconds
  hours = tempTimeNum / 3600;  // integer division with total seconds / seconds per hour
  minutes = (tempTimeNum - (hours * 3600)) / 60;  // integer division with the remaining seconds / seconds per minute
  
  if (![self hasSunRisenToday] || [self hasSunSetToday]) {
    riseOrSet = @"until the sun rises";
  } else {
    riseOrSet = @"of sunlight left";
  }
  
  if (hours > 0) {
    if (minutes > 45) {
      minuteString = @"";
    } else if (minutes > 30) {
      minuteString = @"¾";
    } else if (minutes > 15) {
      minuteString = @"½";
    } else {
      minuteString = @"¼";
    }
    
    return [NSString stringWithFormat:@"%d%@ hours %@.", hours, minuteString, riseOrSet];
  }
  return [NSString stringWithFormat:@"%d minutes %@", minutes, riseOrSet];
}

- (BOOL)hasSunRisenToday {
  return ([[self getTodaySunriseDate] timeIntervalSinceNow] < 0);
}

- (BOOL)hasSunSetToday {
  return ([[self getTodaySunsetDate] timeIntervalSinceNow] < 0);
}

- (double)getLatitude {
  return currentLocation.coordinate.latitude;
}

- (double)getLongitude {
  return currentLocation.coordinate.longitude;
}

- (void)updateDictionary {
  NSDate *tempDate;
  NSString *riseOrSet;
  
  if (![self hasSunRisenToday]) {
    // the sun hasn't risen today
    tempDate = [self getTodaySunriseDate];
    riseOrSet = @"The sun will rise at";
  } else if (![self hasSunSetToday]) {
    // the sun has not set today
    tempDate = [self getTodaySunsetDate];
    riseOrSet = @"The sun will set at";
  } else {
    // the sun has set today
    tempDate = [self getTomorrowSunriseDate];
    riseOrSet = @"The sun will rise at";
  }
  
  [myDefaults setObject:[self getRiseOrSetTimeString] forKey:@"time"];
  [myDefaults setObject:[self getTimeLeftString: tempDate] forKey:@"timeLeft"];
  [myDefaults setObject:riseOrSet forKey:@"riseOrSet"];
  [myDefaults synchronize];
}

@end



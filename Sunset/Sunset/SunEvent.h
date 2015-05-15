//
//  SunEvent.h
//  Sunset
//
//  Created by Nathan Ansel on 5/15/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#ifndef Sunset_SunEvent_h
#define Sunset_SunEvent_h


@import CoreLocation;
#import "KosherCocoa.h"
#import <UIKit/UIKit.h>

@interface SunEvent : NSObject <CLLocationManagerDelegate> {
  CLLocationManager *locationManager;
  KCAstronomicalCalendar *astronomicalCalendar;
  KCGeoLocation *currentGeoLocation;
  CLLocation *currentLocation;
  NSUserDefaults *myDefaults;
}

- (SunEvent*)init;
- (void)locationManager:(CLLocationManager*) manager
        didUpdateLocations:(NSArray *)locations;
- (void)locationManager:(CLLocationManager*)manager
        didFailWithError:(NSError *)error;
- (void)updateLocation;
- (NSDate*)getTodaySunsetDate;
- (NSDate*)getTodaySunriseDate;
- (NSDate*)getTomorrowSunriseDate;
- (NSString*)getRiseOrSetTimeString;
- (NSString*)getTimeLeftString: (NSDate*) date;
- (BOOL)hasSunRisenToday;
- (BOOL)hasSunSetToday;
- (double)getLatitude;
- (double)getLongitude;
- (void)updateDictionary;

@end



#endif

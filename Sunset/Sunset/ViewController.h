//
//  ViewController.h
//  Sunset
//
//  Created by Chase McCoy on 5/12/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
  IBOutlet UILabel *latLabel;
  IBOutlet UILabel *longLabel;
  CLLocationManager *locationManager;
}

- (IBAction)getLocation:(id)sender;
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations;
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

@end


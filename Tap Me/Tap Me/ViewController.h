//
//  ViewController.h
//  Tap Me
//
//  Created by Chase McCoy on 5/11/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SECONDS 30;

@interface ViewController : UIViewController <UIAlertViewDelegate> {
  IBOutlet UILabel *scoreLabel;
  IBOutlet UILabel *timerLabel;
  BOOL playing;
  int count;
  int seconds;
  NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UIButton *startStop;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)startStop:(id)sender;
- (void) setupGame;
- (void) subtractTime;
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end


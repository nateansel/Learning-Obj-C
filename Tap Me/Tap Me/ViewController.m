//
//  ViewController.m
//  Tap Me
//
//  Created by Chase McCoy on 5/11/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize startStop;

- (IBAction)buttonPressed:(id)sender {
  if (playing) {
    count++;
    scoreLabel.text = [NSString stringWithFormat:@"Score:\n%i", count];
  }
}

- (IBAction)startStop:(id)sender {
  if (playing) {
    [timer invalidate];
    [self resetGame];
    [startStop setTitle:@"Start!" forState:normal];
  }
  else {
    [self setupGame];
    [startStop setTitle:@"Stop!" forState:normal];
  }
}

- (void)setupGame {
  seconds = SECONDS;
  count = 0;
  playing = false;
  
  timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
  scoreLabel.text = [NSString stringWithFormat:@"Score:\n%i", count];
  
  playing = true;
  timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
}

- (void)resetGame {
  seconds = SECONDS;
  count = 0;
  playing = false;
  [startStop setTitle:@"Start!" forState:normal];
  
  timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
  scoreLabel.text = [NSString stringWithFormat:@"Score:\n%i", count];
}

- (void)subtractTime {
  seconds--;
  timerLabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
  
  if (seconds == 0) {
    [timer invalidate];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You scored %i points", count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil, nil];
    
    [alert show];
  }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  [self resetGame];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self resetGame];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end

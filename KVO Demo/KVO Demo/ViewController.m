//
//  ViewController.m
//  KVO Demo
//
//  Created by Chase McCoy on 8/24/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.customObject = [[MyCustomClass alloc] init];
  self.anotherCustomObject = [[AnotherCustomClass alloc] init];
  
  [self.customObject addObserver:self.anotherCustomObject
                      forKeyPath:NSStringFromSelector(@selector(objectProperty))
                         options:NSKeyValueObservingOptionNew
                                 | NSKeyValueObservingOptionOld
                         context:nil];
}

- (IBAction)slider:(id)sender {
  self.customObject.objectProperty = self.slider.value;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  [self.customObject removeObserver:self.anotherCustomObject forKeyPath:@"objectProperty"];
}

@end

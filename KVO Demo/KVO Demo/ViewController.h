//
//  ViewController.h
//  KVO Demo
//
//  Created by Chase McCoy on 8/24/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCustomClass.h"
#import "AnotherCustomClass.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) MyCustomClass *customObject;
@property (strong, nonatomic) AnotherCustomClass *anotherCustomObject;

- (IBAction)slider:(id)sender;

@end


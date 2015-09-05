//
//  AnotherCustomClass.m
//  KVO Demo
//
//  Created by Chase McCoy on 8/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "AnotherCustomClass.h"

@implementation AnotherCustomClass

- (instancetype)init {
  self = [super init];
  if (self) {
    self.anotherObjectProperty = 0;
  }
  return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
  if ([keyPath isEqualToString:@"objectProperty"]) {
    NSLog(@"\nThe slider value was changed to %@ from %@\n", change[NSKeyValueChangeNewKey], change[NSKeyValueChangeOldKey]);
  }
}



@end

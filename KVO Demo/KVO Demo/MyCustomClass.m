//
//  MyCustomClass.m
//  KVO Demo
//
//  Created by Chase McCoy on 8/24/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import "MyCustomClass.h"

@implementation MyCustomClass

- (instancetype)init {
  self = [super init];
  if (self) {
    self.objectProperty = 0;
  }
  return self;
}

@end

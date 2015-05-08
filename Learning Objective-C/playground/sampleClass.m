//
//  sampleClass.m
//  Learning Objective-C
//
//  Created by Chase McCoy on 5/8/15.
//
//

#import <Foundation/Foundation.h>
#import "sampleClass.h"

// @implementation usually goes in .m
@implementation myClass

// - means instance method
// + means class method
- (int)max:(int)num1 andNum2:(int)num2 {
  int result;
  
  if(num1 > num2) {
    result = num1;
  }
  else {
    result = num2;
  }
  return result;
}

+ (int)min:(int)num1 andNum2:(int)num2 {
  int result;
  
  if(num1 < num2) {
    result = num1;
  }
  else {
    result = num2;
  }
  return result;
}

// Setters
- (void) setDescription : (NSString*)newDescription {
  description = [[NSString alloc] initWithString:newDescription];
}

- (void) setCount : (NSNumber*)newCount {
  count = [[NSNumber alloc] init];
  count = newCount;
}

- (void) setCountAndDescription : (NSString*)newDescription
                        andCount: (NSNumber*)newCount {
  [self setDescription:newDescription];
  [self setCount:newCount];
}

// Getters
- (NSString*) description {
  return description;
}

- (NSNumber*) count {
  return count;
}

// Helpers
- (void) printInfo {
  NSLog(@"\nDescription: %@\n", description);
  NSLog(@"\nCount: %@\n", count);
}

@end



// ================================
// === USING PROPERTIES ===========
// ================================

@implementation myClass2

// - means instance method
// + means class method
- (int)max:(int)num1 andNum2:(int)num2 {
  int result;
  
  if(num1 > num2) {
    result = num1;
  }
  else {
    result = num2;
  }
  return result;
}

+ (int)min:(int)num1 andNum2:(int)num2 {
  int result;
  
  if(num1 < num2) {
    result = num1;
  }
  else {
    result = num2;
  }
  return result;
}

// Setters

// @synthesize implements the setters and getters when using @property
@synthesize description, count;

- (void) setCountAndDescription : (NSString*)newDescription
                        andCount: (NSNumber*)newCount {
  [self setDescription:newDescription];
  [self setCount:newCount];
}

// Helpers
- (void) printInfo {
  NSLog(@"\nDescription: %@\n", description);
  NSLog(@"\nCount: %@\n", count);
}

@end



// ================================
// === USING CATEGORIES ===========
// ================================

// Typically, categories go in their own file
// the implementation should go in NSString+reverse.m

@implementation NSString (reverse)

- (NSString*) reverseString {
  int length = (int)[self length];
  NSMutableString *reversedString;
  
  reversedString = [[NSMutableString alloc] initWithCapacity:length];
  
  while(length > 0 ) {
    // First, call the appendString method on reversedString
    // We are appending an NSString, and calling the stringWithFormat method on that string
    // The format specifier %C gives a 16-bit unicode character
    //        more on this here: https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
    // stringWithFormat takes a second parameter
    // for that parameter, we are passing self with a method call
    // that method is characterAtIndex, which takes an arhgument
    // for that argument, we are passing the decremented length
    [reversedString appendString:[NSString stringWithFormat:@"%C",
                                 [self characterAtIndex:--length]]];
  }
  return reversedString;
}

@end


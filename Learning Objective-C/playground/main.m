//
//  main.m
//  playground
//
//  Created by Chase McCoy on 5/7/15.
//
//

#import <Foundation/Foundation.h>
#import "sampleClass.h"

/* Data Types:
      1. int
      2. float
      3. bool
      4. char
      5. NSString
      6. NSNumber
*/

void variables() {
  // Declare non-object (scalar) variables like in C
  int number = 5;
  
  // This is how you declare object variables
  // the @ sign is used to declare a literal
  NSString *myString = @"My string.";
  
  // NSString and NSNumber are objects, which mean they have methods
  // For example, NSString has a 'length' method
  int stringLength = [myString length];
  printf("%d\n", stringLength);
  
}

void strings() {
  NSString *make = @"Porsche";
  NSString *model = @"911";
  int year = 1968;
  NSString *message = [NSString stringWithFormat:@"That's a %@ %@ from %d!",
                       make, model, year];
  NSLog(@"\n%@\n", message);
  
  for (int i=0; i<[make length]; i++) {
    unichar letter = [make characterAtIndex:i];
    NSLog(@"\n%d: %hu\n", i, letter);
  }
  
  // NSString's are pointers, so don't compare using ==, etc.
  // Use these methods instead!
  NSString *car = @"Porsche Boxster";
  if ([car isEqualToString:@"Porsche Boxster"]) {
    NSLog(@"That car is a Porsche Boxster");
  }
  if ([car hasPrefix:@"Porsche"]) {
    NSLog(@"That car is a Porsche of some sort");
  }
  if ([car hasSuffix:@"Carrera"]) {
    // This won't execute
    NSLog(@"That car is a Carrera");
  }
  
  // You can also compare strings
  // This is case sensitive, use caseInsensitiveCompare otherwise
  NSString *otherCar = @"Ferrari";
  NSComparisonResult result = [car compare:otherCar];
  if (result == NSOrderedAscending) {
    NSLog(@"The letter 'P' comes before 'F'");
  } else if (result == NSOrderedSame) {
    NSLog(@"We're comparing the same string");
  } else if (result == NSOrderedDescending) {
    NSLog(@"The letter 'P' comes after 'F'");
  }
  
  // You can combine strings, but...
  // NSString is immutable, so this returns a new string
  // NSMutableString is mutable though...
  make = @"Ferrari";
  model = @"458 Spider";
  car = [make stringByAppendingString:model];
  NSLog(@"%@", car);        // Ferrari458 Spider
  car = [make stringByAppendingFormat:@" %@", model];
  NSLog(@"%@", car);        // Ferrari 458 Spider (note the space)
  
  // A whole lot more on strings here:
  // http://rypress.com/tutorials/objective-c/data-types/nsstring
}

// ================================
// === BLOCKS =====================
// ================================

void testBlocks() {
  // 'g' is the block pointer
  int (^sum)(int, int) = ^(int a, int b)
  {
    return a + b;
  };
  
  // Blocks can be defined inside of functions, including main.
  
  // Using a block:
  
  int s = sum(1.2, 2.8);
}

// ================================
// === END OF BLOCKS ==============
// ================================




// ================================
// === SAMPLE CLASS ===============
// ================================

void testSampleClass() {
  // Test class versus object methods
  /*
  int a = 100;
  int b = 200;
  int retVal;
  
  retVal = [myClass min:a andNum2:b];
  NSLog(@"\nMin value is %d\n", retVal);
  
  // The init method is inherited from NSObject
  myClass *myObject = [[myClass alloc] init];
  retVal = [myObject max:a andNum2:b];
  
  NSLog(@"\nMax value is %d\n", retVal);
   */
  
  // Test setters and getters
  /*
  myClass *myObject = [[myClass alloc] init];
  NSNumber *num1 = [NSNumber numberWithInt:100];
  NSNumber *num2 = [NSNumber numberWithInt:50];
  [myObject printInfo];
  [myObject setCount:num1];
  [myObject setDescription:@"Test"];
  [myObject printInfo];
  
  [myObject setCountAndDescription:@"Testing Again" andCount: num2];
  [myObject printInfo];
   */
  
  // Test @property and @synthesize
  /*
  myClass2 *myObject = [[myClass2 alloc] init];
  NSNumber *num1 = [NSNumber numberWithInt:100];
  NSNumber *num2 = [NSNumber numberWithInt:50];
  [myObject printInfo];
  [myObject setCount:num1];
  [myObject setDescription:@"Test"];
  [myObject printInfo];
  
  [myObject setCountAndDescription:@"Testing Again" andCount: num2];
  [myObject printInfo];
  */
  
  // Test categories
  NSString* testString = @"Just a test";
  NSLog(@"\nOriginal: %@\n", testString);
  testString = [testString reverseString];
  NSLog(@"\nReversed: %@", testString);
  
}

// ================================
// === END OF SAMPLE CLASS ========
// ================================



int main() {
  //variables();
  
  //1 < 5 ? NSLog(@"True") : NSLog(@"False");
  
  testSampleClass();
  //testBlocks();
  
  return 0;
}









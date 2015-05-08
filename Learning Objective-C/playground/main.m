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









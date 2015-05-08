//
//  main.m
//  playground
//
//  Created by Chase McCoy on 5/7/15.
//
//

#import <Foundation/Foundation.h>

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

// @interface usually goes in .h
@interface myClass : NSObject {
  NSString *description;
  NSNumber *count;
}

- (int)max:(int)num1 andNum2:(int)num2;
+ (int)min:(int)num1 andNum2:(int)num2;

// Setters
- (void) setDescription : (NSString*)newDescription;
- (void) setCount : (NSNumber*)newCount;
- (void) setCountAndDescription : (NSString*)newDescription
                                  andCount: (NSNumber*)newCount;

// Getters
- (NSString*) description;
- (NSNumber*) count;

// Helpers
- (void) printInfo;

@end

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

void testSampleClass() {
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
  
  myClass *myObject = [[myClass alloc] init];
  NSNumber *num1 = [NSNumber numberWithInt:100];
  NSNumber *num2 = [NSNumber numberWithInt:50];
  [myObject printInfo];
  [myObject setCount:num1];
  [myObject setDescription:@"Test"];
  [myObject printInfo];
  
  [myObject setCountAndDescription:@"Testing Again" andCount: num2];
  [myObject printInfo];
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









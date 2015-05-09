//
//  sampleClass.h
//  Learning Objective-C
//
//  Created by Chase McCoy on 5/8/15.
//
//

#ifndef Learning_Objective_C_sampleClass_h
#define Learning_Objective_C_sampleClass_h

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



// ================================
// === USING PROPERTIES ===========
// ================================

// @interface usually goes in .h
@interface myClass2 : NSObject {
  NSString *description;
  NSNumber *count;
}

- (int)max:(int)num1 andNum2:(int)num2;
+ (int)min:(int)num1 andNum2:(int)num2;

// Setters

// @property sets atrributes
// readwrite automatically creates setters and getters
// has to be paired with @synthesize in implementation.
// Fun fact: if you use properties, you don't even have to
// declare the instance vafriables up there in the curly braces
@property(readwrite, strong) NSString *description;
@property(readwrite, strong) NSNumber *count;

- (void) setCountAndDescription : (NSString*)newDescription
                        andCount: (NSNumber*)newCount;

// Getters
- (NSString*) description;
- (NSNumber*) count;

// Helpers
- (void) printInfo;

@end



// ================================
// === USING CATEGORIES ===========
// ================================

//Categories allow us to add methods to an existing class, so that all instances of that class in your application gain your functionality. For example, say we have 100 NSString objects in your app, but you'd like to make a custom subclass so each NSString has an extra method (reverseString for example). With categories we can simply add the method in a category and all instances will be allowed to use the new method. The syntax is obviously slightly different from subclassing and categories don't allow you to use instance variables. However, it is possible to overwrite a method already in place, but this should be done with caution and only if doing so is really necessary.

// Typically, categories go in their own file
// the implementation should go in NSString+reverse.h

@interface NSString (reverse)

- (NSString*) reverseString;

@end


#endif

//
//  Student.m
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-29.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import "Student.h"
#import "Admin.h"

@implementation Student

-(id)init
{
    return [self initWithLastName:@"" firstName:@"" course:@""];
}
-(id)initWithLastName:(NSString *)lastName firstName:(NSString *)firstName course:(NSString *)course
{
    self =[super init];
    if (self){
        self.lastName = lastName;
        self.firstName = firstName;
        self.course = course;
    }
    return self;
}
-(id)studentGetMessage:(Admin *)message
{
    return message;
}
-(id)allStudentGetMessage:(Admin *)message
{
    return message;
}

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc]init];
    selfAsJson[@"lastName"] = self.lastName;
    selfAsJson[@"firstName"] = self.firstName;
    selfAsJson[@"course"] = self.course;
    
    return selfAsJson;
    
}
-(NSArray *)serializeStudentToJson:(id) objects
{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    
    for (id object in objects) {
        [result addObject:[object jsonValue]];
    }
    return result;
}

@end

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
    return [self initWithLastName:@"" firstName:@"" studentId:@""];
}
-(id)initWithLastName:(NSString *) lastName firstName:(NSString *) firstName studentId:(NSString *) studentId
{
    self =[super init];
    if (self){
        self.lastName = lastName;
        self.firstName = firstName;
        self.studentId = studentId;
    }
    return self;
}
-(id)readMessageFromAdmin:(Admin *)message
{
    return message;
}
-(id)readGeneralMessage:(Admin *)message
{
    return message;
}

-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc]init];
    selfAsJson[@"lastName"] = self.lastName;
    selfAsJson[@"firstName"] = self.firstName;
    selfAsJson[@"studentId"] = self.studentId;

    
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
-(NSString *)description
{
    return [NSString stringWithFormat:@"Student:%@ %@ studentID:%@",[self firstName],[self lastName], [self studentId]];
}

@end

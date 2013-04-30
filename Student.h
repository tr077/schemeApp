//
//  Student.h
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-29.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Admin.h"

@interface Student : NSObject

@property (nonatomic, copy) NSString * firstName;
@property (nonatomic, copy) NSString * lastName;
@property (nonatomic, copy) NSString * course;
@property (nonatomic, copy) NSString * studentId;

-(id)initWithLastName:(NSString *) lastName firstName:(NSString *) firstName course:(NSString *) course;

-(id)jsonValue;

-(NSArray *)serializeStudentToJson:(id) objects;

-(id)studentGetMessage:(Admin *)message;
-(id)allStudentGetMessage:(Admin *)message;



@end

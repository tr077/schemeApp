//
//  Admin.h
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-30.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;
@class Course;

@interface Admin : NSObject

@property (nonatomic, copy) NSString *message;

-(id)initWithMessageToAllStudents:(NSString *)message;

-(id)initWithMessage:(NSString *)message toOneStudent:(Student *)student;

-(id)jsonValue;

-(NSArray *)serializeMessageToJson:(id) objects;



@end

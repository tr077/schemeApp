//
//  Course.m
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-29.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import "Course.h"

@implementation Course

-(id)init
{
    return [self initWithCourseName:@"" teacher:@"" date:@"" classRoom:@"" tasks:@""];
}
-(id)initWithCourseName:(NSString *) courseName teacher:(NSString *) teacher date:(NSString *) date classRoom:(NSString *) classRoom tasks:(NSString *)tasks
{
    self =[super init];
    if (self){
        self.courseName = courseName;
        self.teacher = teacher;
        self.date = date;
        self.classRoom = classRoom;
        self.tasks = tasks;
    }
    return self;
}
-(id)jsonValue
{
    NSMutableDictionary *selfAsJson = [[NSMutableDictionary alloc]init];
    selfAsJson[@"courseName"] = self.courseName;
    selfAsJson[@"teacher"] = self.teacher;
    selfAsJson[@"date"] = self.date;
    selfAsJson[@"classRoom"] = self.classRoom;
    selfAsJson[@"tasks"] = self.tasks;

    
    return selfAsJson;
    
}
-(NSArray *)serializeCourseToJson:(id) objects
{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    
    for (id object in objects) {
        [result addObject:[object jsonValue]];
    }
    return result;
}

@end

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
    return [self initWithCourseName:@"" teacher:@"" date:@"" classRoom:@"" tasks:@"" studentsInCourse:@[]];
}
-(id)initWithCourseName:(NSString *) courseName teacher:(NSString *) teacher date:(NSString *) date classRoom:(NSString *) classRoom tasks:(NSString *)tasks studentsInCourse:(NSArray *)studentsInCourse
{
    self =[super init];
    if (self){
        self.courseName = courseName;
        self.teacher = teacher;
        self.date = date;
        self.classRoom = classRoom;
        self.tasks = tasks;
        self.studentsInCourse = studentsInCourse;
        self->_id = [[NSUUID UUID] UUIDString];
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
    selfAsJson[@"studentsInCourse"] = self.studentsInCourse;
    selfAsJson[@"id"] = self.id;

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
-(NSUInteger)hash
{
    return 37 * [self.id hash];
}
-(BOOL)isEqual:(id)other
{
    if(other == self){
        return YES;
    }
    if(other && [other isMemberOfClass:[self class]]){
        return [[other id]isEqualToString:self.id];
    }
    return NO;
}
//-(NSString *)description
//{
//    return [NSString stringWithFormat:@"Coursename:%@ Teacher:%@ Date:%@ Classroom:%@ Tasks:%@ studentsInCourse:",[self courseName] ,[self teacher], [self date], [self classRoom], [self.tasks]];
//}

@end

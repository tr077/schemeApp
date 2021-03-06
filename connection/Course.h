//
//  Course.h
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-29.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject

@property (nonatomic, copy) NSString *courseName;
@property (nonatomic, copy) NSString *teacher;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *classRoom;
@property (nonatomic, copy) NSString *tasks;
@property (nonatomic, copy) NSArray *studentsInCourse;
@property (nonatomic, copy, readonly) NSString *id;



-(id)initWithCourseName:(NSString *) courseName teacher:(NSString *) teacher date:(NSString *) date classRoom:(NSString *) classRoom tasks:(NSString *)tasks studentsInCourse:(NSArray *)studentsInCourse;

-(id)jsonValue;

-(NSArray *)serializeCourseToJson:(id) objects;


@end

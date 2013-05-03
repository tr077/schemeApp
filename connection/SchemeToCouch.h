//
//  StudentToCouch.h
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-29.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Course.h"
#import "Admin.h"

@interface StudentToCouch : NSObject

-(void)saveToCouch:(Student *) student;
-(void)getStudentFromCouch:(Student *)student;

-(void)saveCourseToCouch:(Course *) course;
-(void)getCourseFromCouch:(Course *)course;

-(void)saveMessageToCouch:(Admin *)message;






@end

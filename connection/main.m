//
//  main.m
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-25.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SchemeToCouch.h"
#import "Student.h"
#import "Course.h"
#import "Admin.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Student *student1 = [[Student alloc]initWithLastName:@"Hemmingsson" firstName:@"Joanna" course:@"Music"];
        Student *student3 = [[Student alloc]initWithLastName:@"Karwacki" firstName:@"Ewa" course:@"polish"];
        
        StudentToCouch *connect = [[StudentToCouch alloc]init];
        
        [connect saveToCouch:student1];
        [connect saveToCouch:student3];
        
        [connect getStudentFromCouch:student1];
        [connect getStudentFromCouch:student3];

        
        Course *polishCourse = [[Course alloc]initWithCourseName:@"Polski" teacher:@"Anna Wolcinska" date:@"2013-04-29" classRoom:@"u54" tasks:@"Przygotuj temat na historie"];
        Course *musicCourse = [[Course alloc]initWithCourseName:@"Music" teacher:@"Ralf Gyllenhammar" date:@"2013-04-30" classRoom:@"u66" tasks:@"Lyssna på Bed On Fire"];

        [connect saveCourseToCouch:polishCourse];
        [connect saveCourseToCouch:musicCourse];
        
        [connect getCourseFromCouch:polishCourse];
        
        Admin *message1 = [[Admin alloc]initWithMessage:@"hejhej" toStudent:student1];
        Admin *message2 = [[Admin alloc]initWithMessageToAllStudents:@"dagens lektion är inställd"];
        [connect saveMessageToCouch:message1];
        [connect saveMessageToCouch:message2];
        [student1 studentGetMessage:message1];
        
        [student1 allStudentGetMessage:message2];
        [student3 allStudentGetMessage:message2];
        
        NSLog(@"Student:%@ %@ and message:%@", student1.firstName, student1.lastName,message1.message);
        NSLog(@"Student:%@ %@ and message:%@", student3.firstName, student3.lastName,message2.message);



        



        [[NSRunLoop currentRunLoop] run];

        
           }
    return 0;
}


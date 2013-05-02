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
        
        Student *musicStudent = [[Student alloc]initWithLastName:@"Hemmingsson" firstName:@"Joanna" studentId:@"920112-0301"];
        
        Student *polishStudent = [[Student alloc]initWithLastName:@"Karwacki" firstName:@"Ewa" studentId:@"62234-111"];
        
        Student *polishStudentTwo = [[Student alloc]initWithLastName:@"Hagfeldt" firstName:@"Jens" studentId:@"23423"];

        StudentToCouch *connect = [[StudentToCouch alloc]init];
        
        [connect saveToCouch:musicStudent];
        [connect saveToCouch:polishStudent];
        [connect saveToCouch:polishStudentTwo];
        
        [connect getStudentFromCouch:musicStudent];
        [connect getStudentFromCouch:polishStudent];
        [connect getStudentFromCouch:polishStudentTwo];
        
        Course *polishCourse = [[Course alloc]initWithCourseName:@"polish" teacher:@"Anna Wlocz" date:@"2013-11-22" classRoom:@"u66" tasks:@"przeczytaj sfsfsdfs" studentsInCourse:@[polishStudent.description, polishStudentTwo.description]];
        Course *musicCourse = [[Course alloc]initWithCourseName:@"music" teacher:@"Ralf Gyllenhammar" date:@"2012-323.2332" classRoom:@"u54" tasks:@"dfsdfds" studentsInCourse:@[musicStudent.description]];
        
        [connect saveCourseToCouch:polishCourse];
        [connect saveCourseToCouch:musicCourse];
        
        [connect getCourseFromCouch:polishCourse];
        [connect getCourseFromCouch:musicCourse];

        Admin *message1 = [[Admin alloc]initWithMessage:@"hejhej" toOneStudent:musicStudent];
        Admin *message2 = [[Admin alloc]initWithMessageToAllStudents:@"dagens lektion är inställd"];
        [connect saveMessageToCouch:message1];
        [connect saveMessageToCouch:message2];
        //[connect getMessageFromCouch:message2];
        
        
//        [musicStudent readMessageFromAdmin:message1];
//        [musicStudent readGeneralMessage:message2];
//        [polishStudent readGeneralMessage:message2];
    
//        NSLog(@"Student:%@ %@, Message from Admin:%@", musicStudent.firstName, musicStudent.lastName,message1.message);
//        NSLog(@"Student:%@ %@, Message from Admin:%@", musicStudent.firstName, musicStudent.lastName,message2.message);
//        NSLog(@"Student:%@ %@ ,Message from Admin:%@", polishStudent.firstName, polishStudent.lastName,message2.message);

        [[NSRunLoop currentRunLoop] run];
        
        }
    return 0;
}


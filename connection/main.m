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
#pragma - skapar studenter
        
        Student *musicStudent = [[Student alloc]initWithLastName:@"Hemmingsson" firstName:@"Joanna" studentId:@"920112-0301"];
        
        Student *polishStudent = [[Student alloc]initWithLastName:@"Karwacki" firstName:@"Ewa" studentId:@"62234-111"];
        
        Student *polishStudentTwo = [[Student alloc]initWithLastName:@"Hagfeldt" firstName:@"Jens" studentId:@"23423"];
        
        Student *djStudent = [[Student alloc]initWithLastName:@"Dyvelcrona" firstName:@"Björn" studentId:@"2424442243"];
        
        Student *djStudentTwo = [[Student alloc]initWithLastName:@"Hemmingsson" firstName:@"Tony    " studentId:@"123456"];
        
        Student *appStudent = [[Student alloc]initWithLastName:@"Melhus" firstName:@"Cindy" studentId:@"921023"];
        
        Student *marketingStudent = [[Student alloc]initWithLastName:@"sffsf" firstName:@"dsffsdsd" studentId:@"sdfdsfs"];

        StudentToCouch *connect = [[StudentToCouch alloc]init];
#pragma - sparar studenterna till couch

        [connect saveToCouch:musicStudent];
        [connect saveToCouch:polishStudent];
        [connect saveToCouch:polishStudentTwo];
        [connect saveToCouch:djStudent];
        [connect saveToCouch:djStudentTwo];
        [connect saveToCouch:appStudent];
        [connect saveToCouch:marketingStudent];
#pragma -  Hämtar studenterna från couch

//        [connect getStudentFromCouch:musicStudent];
//        [connect getStudentFromCouch:polishStudent];
//        [connect getStudentFromCouch:polishStudentTwo];
#pragma - skapar kurser och inicjerar dem med studenterna. Kurser äger studenter.

        Course *polishCourse = [[Course alloc]initWithCourseName:@"polish" teacher:@"Anna Wlocz" date:@"2013-11-22" classRoom:@"u66" tasks:@"przeczytaj sfsfsdfs" studentsInCourse:@[polishStudent.description, polishStudentTwo.description]];
        
        Course *musicCourse = [[Course alloc]initWithCourseName:@"music" teacher:@"Ralf Gyllenhammar" date:@"2012-323.2332" classRoom:@"u54" tasks:@"dfsdfds" studentsInCourse:@[musicStudent.description]];
        
        Course *djCourse = [[Course alloc]initWithCourseName:@"Dj" teacher:@"Avicci" date:@"2014-02-20" classRoom:@"u22" tasks:@"listen to my new track" studentsInCourse:@[djStudent.description,djStudentTwo.description]];
        
        Course *appDeveloper = [[Course alloc]initWithCourseName:@"appDeveloper" teacher:@"Anders Carlsson" date:@"2014-03-20" classRoom:@"u23" tasks:@"gör en skolapp" studentsInCourse:@[appStudent.description]];
        
        Course *marketing = [[Course alloc]initWithCourseName:@"marketing" teacher:@"Jonas lööw" date:@"2014-04-20" classRoom:@"u99" tasks:@"asdsdsasda" studentsInCourse:@[marketingStudent.description]];



#pragma - lagrar kurserna i couch

        [connect saveCourseToCouch:polishCourse];
        [connect saveCourseToCouch:musicCourse];
        [connect saveCourseToCouch:djCourse];
        [connect saveCourseToCouch:appDeveloper];
        [connect saveCourseToCouch:marketing];
#pragma - Hämtar kurserna från couch

//        [connect getCourseFromCouch:polishCourse];
//        [connect getCourseFromCouch:musicCourse];
 //         [connect getCourseFromCouch:djCourse];
//        [connect getCourseFromCouch:appDeveloper];
//        [connect getCourseFromCouch:marketing];

#pragma - skapar meddelanden

        Admin *message1 = [[Admin alloc]initWithMessage:@"hejhej" toOneStudent:musicStudent];
        Admin *message2 = [[Admin alloc]initWithMessageToAllStudents:@"dagens lektion är inställd"];
        Admin *message3 = [[Admin alloc]initWithMessage:@"czesc" toOneStudent:polishStudentTwo];

#pragma - lagrar meddelanden i couch

        [connect saveMessageToCouch:message1];
        [connect saveMessageToCouch:message2];
        [connect saveMessageToCouch:message3];

        
#pragma - studenterna hämtar sina meddelanden från admin

   [musicStudent readMessageFromAdmin:message1];
    [polishStudentTwo readMessageFromAdmin:message3];
#pragma - skriver ut meddelanden i loggen

        NSLog(@"Student:%@ , Message from Admin:%@", musicStudent.description, message1.message);
        NSLog(@"Student:%@ , Message from Admin:%@", polishStudentTwo.description, message3.message);
        NSLog(@"To all students, general message:%@",message2.message);

        


        [[NSRunLoop currentRunLoop] run];
        
        }
    return 0;
}


//
//  StudentToCouch.m
//  connection
//
//  Created by Joanna Hemmingsson on 2013-04-29.
//  Copyright (c) 2013 Joanna Hemmingsson. All rights reserved.
//

#import "SchemeToCouch.h"
#import "Student.h"
#import "Course.h"

@implementation StudentToCouch

-(void)saveToCouch:(Student *) student
{
    NSData *asStudent = [NSJSONSerialization dataWithJSONObject:student.jsonValue options:NSJSONWritingPrettyPrinted error:NULL];
    
    NSString *studentString = [[NSString alloc]initWithData:asStudent encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://tr077.iriscouch.com/studentstorage"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
//                                                          cachePolicy:NSURLRequestUseProtocolCachePolicy
//timeoutInterval:10.0];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[studentString dataUsingEncoding:NSUTF8StringEncoding]];
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    
}
-(void)getStudentFromCouch:(Student *)student
{
    NSData *asStudent = [NSJSONSerialization dataWithJSONObject:student.jsonValue options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *studentString = [[NSString alloc]initWithData:asStudent encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://tr077.iriscouch.com/studentstorage"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[studentString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    NSLog(@"%@", [[NSString alloc] initWithData:asStudent encoding:NSUTF8StringEncoding]);

}
-(void)saveCourseToCouch:(Course *) course
{
    NSData *asCourse = [NSJSONSerialization dataWithJSONObject:course.jsonValue options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *courseString = [[NSString alloc]initWithData:asCourse encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://tr077.iriscouch.com/coursestorage"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[courseString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    
}
-(void)getCourseFromCouch:(Course *)course
{
    NSData *asCourse = [NSJSONSerialization dataWithJSONObject:course.jsonValue options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *studentString = [[NSString alloc]initWithData:asCourse encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://tr077.iriscouch.com/studentstorage"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[studentString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    NSLog(@"%@", [[NSString alloc] initWithData:asCourse encoding:NSUTF8StringEncoding]);
}
-(void)saveMessageToCouch:(Admin *)message
{
    NSData *asMessage = [NSJSONSerialization dataWithJSONObject:message.jsonValue options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *messageString = [[NSString alloc]initWithData:asMessage encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://tr077.iriscouch.com/messagestorage"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[messageString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    
}
-(void)getMessageFromCouch:(Admin *)message
{
    NSData *asMessage = [NSJSONSerialization dataWithJSONObject:message.jsonValue options:NSJSONWritingPrettyPrinted error:NULL];
    NSString *messageString = [[NSString alloc]initWithData:asMessage encoding:NSUTF8StringEncoding];
    
    NSURL *url= [NSURL URLWithString:@"http://tr077.iriscouch.com/messagestorage"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[messageString dataUsingEncoding:NSUTF8StringEncoding]];
    
    __unused NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    NSLog(@"%@", [[NSString alloc] initWithData:asMessage encoding:NSUTF8StringEncoding]);

    
}




@end

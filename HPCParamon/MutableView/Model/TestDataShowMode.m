//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  TestDataShowMode.m
//  Company
//
//  Created by azayyl on 13-7-16.
//    Copyright (c) 2013年 azayyl. All rights reserved.
//

#import "TestDataShowMode.h"

#pragma mark -

@implementation TestDataShowMode

@synthesize rid = _rid;

@synthesize testid=_testid;


@synthesize testname = _testname;
@synthesize testnamewidth = _testnamewidth;

@synthesize testsex=_testsex;
@synthesize testsexwidth=_testsexwidth;

@synthesize testage=_testage;
@synthesize testagewidth=_testagewidthwidth;

@synthesize testtel=_testtel;
@synthesize testtelwidth=_testtelwidth;

@synthesize testaddress=_testaddress;
@synthesize testaddresswidth=_testaddresswidth;

@synthesize testcellwidth=_testcellwidth;

@synthesize testcellshow=_testcellshow;

+ (void)mapRelation
{
	[self mapPropertyAsKey:@"rid"];
    [self mapProperty:@"testid"	defaultValue:@""];
	[self mapProperty:@"testname"	defaultValue:@""];
    [self mapProperty:@"testnamewidth"	defaultValue:0];
    [self mapProperty:@"testsex"	defaultValue:@""];
    [self mapProperty:@"testsexwidth"	defaultValue:0];
    [self mapProperty:@"testage"	defaultValue:@""];
    [self mapProperty:@"testagewidth"	defaultValue:0];
    [self mapProperty:@"testtel"	defaultValue:@""];
    [self mapProperty:@"testtelwidth"	defaultValue:0];
    [self mapProperty:@"testaddress"	defaultValue:@""];
    [self mapProperty:@"testaddresswidth"	defaultValue:0];
    [self mapProperty:@"testcellwidth"	defaultValue:0];
    [self mapProperty:@"testcellshow"	defaultValue:0];
    
    
}

- (void)load
{
	[super load];
}

- (void)unload
{
	self.rid = nil;
	self.testid = nil;
	self.testname = nil;
    self.testnamewidth = nil;
    
    self.testsex=nil;
    self.testsexwidth=nil;
    
    self.testage=nil;
    self.testagewidth=nil;
    
    self.testtel=nil;
    self.testtelwidth=nil;
    
    self.testaddress=nil;
    self.testaddresswidth=nil;
    self.testcellwidth=nil;
    self.testcellshow=nil;
    
	[super unload];
}

@end
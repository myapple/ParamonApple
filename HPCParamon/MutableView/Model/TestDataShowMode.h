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
//  TestDataShowMode.h
//  Company
//
//  Created by azayyl on 13-7-16.
//    Copyright (c) 2013年 azayyl. All rights reserved.
//

#import "Bee_ActiveRecord.h"

#pragma mark -

@interface TestDataShowMode : BeeActiveRecord

@property (nonatomic, retain) NSNumber *	rid;
@property (nonatomic, retain) NSString *	testid;
@property (nonatomic, retain) NSString *	testname;
@property (nonatomic, retain) NSNumber *	testnamewidth;

@property (nonatomic, retain) NSString *	testsex;
@property (nonatomic, retain) NSNumber *	testsexwidth;

@property (nonatomic, retain) NSString *	testage;
@property (nonatomic, retain) NSNumber *	testagewidth;

@property (nonatomic, retain) NSString *	testtel;
@property (nonatomic, retain) NSNumber *	testtelwidth;

@property (nonatomic, retain) NSString *	testaddress;
@property (nonatomic, retain) NSNumber *	testaddresswidth;

@property (nonatomic, retain) NSNumber *	testcellwidth;
@property (nonatomic, retain) NSNumber *	testcellshow;

@end


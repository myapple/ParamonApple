//
//  PostRequest.h
//  mPortal
//
//  Created by chen neng on 11-12-20.
//  Copyright (c) 2011年 ydtf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "NetworkModuleDelegate.h"
#import "GDataXMLNode.h"

@interface PostRequest : NSObject{
    ASIHTTPRequest* _request;
}
@property (nonatomic,retain)id<NetworkModuleDelegate> owner;
@property (nonatomic,retain)NSString* url;
@property (assign)kPostStatus postStatus;
@property (assign)kBusinessTag businessTag;
@property (assign)NSStringEncoding enc;
@property (nonatomic,readonly,getter = result)GDataXMLDocument* result;

-(void)cancel;

-(void)postXML:(NSString*)xml delegate:(id)delegate;
@end

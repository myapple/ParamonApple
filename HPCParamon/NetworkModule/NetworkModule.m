//
//  NetworkModule.m
//  mPortal
//
//  Created by chen neng on 11-12-20.
//  Copyright (c) 2011年 ydtf. All rights reserved.
//

#import "NetworkModule.h"

@implementation NetworkModule

SYNTHESIZE_SINGLETON_FOR_CLASS(NetworkModule);

- (id)init
{
    self = [super init];
    if (self) {
        queue=[[NSMutableDictionary alloc]init];
    }
    return self;
}
-(void)postBusinessReq:(NSString*)xml 
                   tag:(kBusinessTag)tag 
                 owner:(id<NetworkModuleDelegate>)owner{
    PostRequest* req=(PostRequest*)[queue objectForKey:[NSNumber numberWithInt:tag]];
    if (req==nil) {
        req=[[PostRequest alloc]init];
    }
    req.businessTag=tag;
    req.postStatus=kPostStatusNone;
    
    [queue setObject:req forKey:[NSNumber numberWithInt:tag]];
    req.enc=NSUTF8StringEncoding;
    req.owner=owner;

    req.url=[NSString stringWithFormat:@"http://localhost:8080/RESTServer/Interface"];
    NSLog(@"%s:%@",__FUNCTION__,req.url);
    [req postXML:xml delegate:self];
    if(owner!=nil) [owner beginPost:tag];
}
-(void)cancel:(kBusinessTag)tag{
    PostRequest* req=(PostRequest*)[queue objectForKey:[NSNumber numberWithInt:tag]];
    if (req && [req isKindOfClass:[PostRequest class]]) {
        [req cancel];
    }
}
#pragma mark ASIHTTPRequest delegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    PostRequest* req=(PostRequest*)[queue objectForKey:
                                    [NSNumber numberWithInt:request.tag]];
    req.postStatus=kPostStatusEnded;
    if (req.owner!=nil) {
        [req.owner endPost:req.result
				  business: req.businessTag];
    }

}
// 请求失败，获取 error
- (void)requestFailed:(ASIHTTPRequest *)request
{
    PostRequest* req=(PostRequest*)[queue objectForKey:
                                    [NSNumber numberWithInt:request.tag]];
	NSError *error = [request error];
	if (req.owner!=nil) {
        [req.owner errorPost:error
					business: req.businessTag];
    }
}
-(void)dealloc{
    [queue release];
    [super dealloc];
}
@end

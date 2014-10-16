#import "AFTwitterAPIClient.h"

#import "AFJSONRequestOperation.h"

//static NSString * const kAFTwitterAPIBaseURLString = @"http://api.twitter.com/1/";
//static NSString * const kAFTwitterAPIBaseURLString = @"http://118.26.72.28:8080/PARAMON_WEB/";
//static NSString * const kAFTwitterAPIBaseURLString = @"http://172.18.2.131:8080/PARAMON_WEB/";
//checkUser-USER?userName=admin&password=Para@2014";
static NSString * const kAFTwitterAPIBaseURLString = @"http://172.18.4.34:8080/PARAMON_WEB/";

@implementation AFTwitterAPIClient

+ (AFTwitterAPIClient *)sharedClient {
    static AFTwitterAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFTwitterAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kAFTwitterAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end

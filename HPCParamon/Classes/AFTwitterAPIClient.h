#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface AFTwitterAPIClient : AFHTTPClient

+ (AFTwitterAPIClient *)sharedClient;

@end

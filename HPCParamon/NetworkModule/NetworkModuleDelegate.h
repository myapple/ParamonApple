#import "GDataXMLNode.h"
enum kPostStatus{
    kPostStatusNone=0,
    kPostStatusBeging=1,
    kPostStatusEnded=2,
    kPostStatusError=3,
    kPostStatusReceiving=4
};
typedef enum kPostStatus kPostStatus;

enum kBusinessTag
{
	kBusinessTagUserLogin=0,
    kBusinessTagGetDeptPeople= 1,
	kBusinessTagTest=2
};
typedef enum kBusinessTag kBusinessTag;

@protocol NetworkModuleDelegate<NSObject>
@required
-(void)beginPost:(kBusinessTag)tag;
-(void)endPost:(GDataXMLDocument*)result business:(kBusinessTag)tag;
-(void)errorPost:(NSError*)err business:(kBusinessTag)tag;
@end
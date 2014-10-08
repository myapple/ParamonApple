//
//  ViewController.h
//  StoryboardExample
//
//  Created by Nick Lockwood on 08/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "header.h"

@interface ICarouseViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) IBOutlet iCarousel *carousel;
@property (strong,nonatomic) ParWorkData* workDetailData;
@property (strong,nonatomic) NSDictionary* workDetailMsg;
@end

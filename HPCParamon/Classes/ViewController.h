//
//  ViewController.h
//  QBTitleView
//
//  Created by questbeat on 2012/12/27.
//  Copyright (c) 2012年 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QBTitleView.h"
#import "ANViewController.h"
@interface ViewController : UIViewController <QBTitleViewDelegate, UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UITextField *textField;
@property (nonatomic, retain) QBTitleView *titleView;
@property (nonatomic, retain) ANViewController * second;
- (IBAction)switchProfileImage:(id)sender;
- (IBAction)messageButtonPress:(id)sender;
@end

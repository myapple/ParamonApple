//
//  ViewController.m
//  QBTitleView
//
//  Created by questbeat on 2012/12/27.
//  Copyright (c) 2012年 Katsuma Tanaka. All rights reserved.
//

#import "ViewController.h"

// Categories
#import "UIImage+tintedImage.h"
#import "UIBarButtonItem+Badge.h"
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    QBTitleView *titleView = [[QBTitleView alloc] initWithFrame:CGRectMake(0, 0, 170, 44)];
    titleView.delegate = self;
    titleView.image = [UIImage imageNamed:@"logol.png"];
    titleView.highlightedImage = [[UIImage imageNamed:@"logol.png"] tintedImageUsingColor:[UIColor colorWithWhite:0.2 alpha:0.5]];
    titleView.title = @"Code4App";
    
    self.navigationItem.titleView = titleView;
    
    self.titleView = titleView;
    
    // Build your regular UIBarButtonItem with Custom View
    UIImage *image = [UIImage imageNamed:@"someImage"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0,0,image.size.width, image.size.height);
    [button addTarget:self action:@selector(messageButtonPress:) forControlEvents:UIControlEventTouchDown];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    // Make BarButton Item
    UIBarButtonItem *navrightButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = navrightButton;
    self.navigationItem.rightBarButtonItem.badgeValue = @"+1";
    self.navigationItem.rightBarButtonItem.badgeBGColor = self.navigationController.navigationBar.tintColor;

    
    UIImage*img =[UIImage imageNamed:@"aa.png"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:img]];
    [titleView release];
}

- (void)dealloc {
    [_textField release];
    [_titleView release];
    
    [super dealloc];
}


#pragma mark -

- (IBAction)switchProfileImage:(id)sender {
    UISwitch *profileImageSwitch = (UISwitch *)sender;
    
    if(profileImageSwitch.on) {
        self.titleView.image = [UIImage imageNamed:@"logol.png"];
        self.titleView.highlightedImage = [[UIImage imageNamed:@"logol.png"] tintedImageUsingColor:[UIColor colorWithWhite:0.2 alpha:0.5]];
    } else {
        self.titleView.image = nil;
        self.titleView.highlightedImage = nil;
    }
}
- (IBAction)messageButtonPress:(id)sender{
    
    NSLog(@"messageButtonPress");
    UIStoryboard* theStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* destView = [theStoryBroad instantiateViewControllerWithIdentifier:@"MsgViewController"];
    
	[self.navigationController pushViewController:destView animated: YES];
}
#pragma mark - QBTitleViewDelegate

- (void)titleViewDidTouchUpInside:(QBTitleView *)titleView
{
    NSLog(@"Pushed");
}
#pragma mark - QBTitleViewDelegate
-(void) SwitchView
{
    
}
#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.titleView.title = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    return YES;
}

@end

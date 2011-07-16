//
//  iOS5_AlertsViewController.m
//  iOS5_Alerts
//
//  Created by sid on 16/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "iOS5_AlertsViewController.h"

@implementation iOS5_AlertsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[SMAlertBlock sharedInstance] simpleAlert:@"hi alert Title!"
                                       message:@"hi alert Message!"
                             cancelButtonTitle:@"Cancel"
                             otherButtonTitles:[NSArray arrayWithObject:@"OK"] 
                            withAlertViewStyle:UIAlertViewStylePlainTextInput
                                 blockOnCancel:^(int buttonIndex, NSString *titleAlert) {
                                     NSLog(@"cancel");
                                 } 
                                 blockOnAccept:^(int buttonIndex, NSString *titleAlert, NSString *titleButton, UIAlertViewStyle style, NSString *firstField, NSString *secondField) {
                                     NSLog(@"accept, %@, %@", firstField, secondField);
                                 }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

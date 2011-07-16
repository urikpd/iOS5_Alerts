//
//  SMAlertBlock.m
//  iOS5_Alerts
//
//  Created by Sergio on 16/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SMAlertBlock.h"

static SMAlertBlock *sharedAlert = nil;
static SMCancelBlock cancelBlock;
static SMAcceptBlock acceptBlock;

@implementation SMAlertBlock

- (id)init
{
    self = [super init];
    if (self)
    {
        // Initialization code here.
    }
    
    return self;
}

+ (SMAlertBlock *)sharedInstance
{
    @synchronized(self)
    {
        if (sharedAlert == nil)
        {
            sharedAlert = [self new];
        }
    }
    
    return sharedAlert;
}

- (void)simpleAlert:(NSString *)title 
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButton
  otherButtonTitles:(NSArray*)otherButtons
 withAlertViewStyle:(UIAlertViewStyle)style
      blockOnCancel:(SMCancelBlock)cancel
      blockOnAccept:(SMAcceptBlock)accept
{
    
    cancelBlock = [cancel copy];
    acceptBlock = [accept copy];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelButton
                                          otherButtonTitles:nil];
    
    alert.alertViewStyle = style;

    for(NSString *button in otherButtons)
        [alert addButtonWithTitle:button];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertViewStyle alertStyle = alertView.alertViewStyle;
    NSString *firstField, *secondField = @"";
    
    if (alertStyle != UIAlertViewStyleDefault)
    {
        UITextField *field = [alertView textFieldAtIndex:0];
        firstField = field.text;
        
        if (alertStyle == UIAlertViewStyleLoginAndPasswordInput)
        {
            UITextField *field = [alertView textFieldAtIndex:1];
            secondField = field.text;
        }
    }

    if(buttonIndex == [alertView cancelButtonIndex])
    {
        cancelBlock(buttonIndex, alertView.title);
    }
    else
    {
        acceptBlock(buttonIndex, alertView.title, [alertView buttonTitleAtIndex:buttonIndex], alertView.alertViewStyle, firstField, secondField);
    }
}

@end

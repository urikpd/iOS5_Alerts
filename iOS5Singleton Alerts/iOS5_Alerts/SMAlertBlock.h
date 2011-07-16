//
//  SMAlertBlock.h
//  iOS5_Alerts
//
//  Created by Sergio on 16/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SMCancelBlock)(int buttonIndex, NSString *titleAlert);
typedef void (^SMAcceptBlock)(int buttonIndex, NSString *titleAlert, NSString *titleButton, UIAlertViewStyle style, NSString *firstField, NSString *secondField);

@interface SMAlertBlock : NSObject <UIAlertViewDelegate>

+ (SMAlertBlock *)sharedInstance;
- (void)simpleAlert:(NSString *)title 
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButton
  otherButtonTitles:(NSArray*)otherButtons
 withAlertViewStyle:(UIAlertViewStyle)style
      blockOnCancel:(SMCancelBlock)cancel
      blockOnAccept:(SMAcceptBlock)accept;

@end

//
//  Background-Button.m
//  WWDC
//
//  Created by Grant Goodman on 4/7/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Background-Button.h"

@implementation BB

+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    BB *button = [super buttonWithType:buttonType];
    [button postButtonWithTypeInit];
    return button;
}

- (void)postButtonWithTypeInit
{
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.2 animations:^
     {
         [self setHighlighted:YES];
         self.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
         self.layer.borderColor = [[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
         self.titleLabel.textColor = [UIColor whiteColor];
     }];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.2 animations:^
     {
         [self setHighlighted:NO];
         self.backgroundColor = [UIColor whiteColor];
         self.titleLabel.textColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
     }];
    
    if (![self.linkString isEqualToString:@""])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.linkString]];
    };
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.2 animations:^
     {
         self.viewForBaselineLayout.alpha = 1;
         self.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
         self.titleLabel.textColor = [UIColor whiteColor];
     }];
}

@end

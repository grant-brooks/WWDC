//
//  Circular-Button.m
//  WWDC
//
//  Created by Grant Goodman on 4/13/15.
//  Copyright © 2015 Macster Software Inc. All rights reserved.
//

#import "Circular-Button.h"

@interface CB ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) UIColor *color;
@end

@implementation CB

- (void)drawCircularButton:(UIColor *)color
{
    self.color = color;
    
    [self setTitleColor:color forState:UIControlStateNormal];
    
    self.circleLayer = [CAShapeLayer layer];
    
    [self.circleLayer setBounds:CGRectMake(0.0f, 0.0f, [self bounds].size.width,
                                           [self bounds].size.height)];
    [self.circleLayer setPosition:CGPointMake(CGRectGetMidX([self bounds]),CGRectGetMidY([self bounds]))];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.circleLayer setPath:[path CGPath]];
    
    [self.circleLayer setStrokeColor:[[UIColor whiteColor] CGColor]];
    
    [self.circleLayer setLineWidth:2.0f];
    [self.circleLayer setFillColor:[[UIColor whiteColor] CGColor]];
    
    [[self layer] addSublayer:self.circleLayer];
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        [self.circleLayer setFillColor:[[UIColor grayColor] CGColor]];
        [self.circleLayer setStrokeColor:[[UIColor grayColor] CGColor]];
        self.titleLabel.textColor = self.color;
    }
    else
    {
        [self.circleLayer setFillColor:[UIColor whiteColor].CGColor];
        [self.circleLayer setStrokeColor:[[UIColor whiteColor] CGColor]];
        self.titleLabel.textColor = self.color;
    }
}

@end
//
//  DrawingView.m
//  Drawings
//
//  Created by Alexey Baryshnikov on 04.06.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"drawRect %@", NSStringFromCGRect(rect));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect square1 = CGRectMake(100, 100, 100, 100);
    CGRect square2 = CGRectMake(200, 200, 100, 100);
    CGRect square3 = CGRectMake(300, 300, 100, 100);
    
//    CGContextSetFillColorWithColor(context, [UIColor systemPinkColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor systemPinkColor].CGColor);

    CGContextAddRect(context, square1);
    CGContextAddRect(context, square2);
    CGContextAddRect(context, square3);
    
//    CGContextFillPath(context);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    
    CGContextAddEllipseInRect(context, square1);
    CGContextAddEllipseInRect(context, square2);
    CGContextAddEllipseInRect(context, square3);

    
    CGContextFillPath(context);
//    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetLineWidth(context, 3.f);
    CGContextSetLineCap(context, kCGLineCapRound);

    
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));
    CGContextAddLineToPoint(context, CGRectGetMinX(square3), CGRectGetMaxY(square3));
    
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square1), CGRectGetMinY(square1));
    CGContextAddLineToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor systemGrayColor].CGColor);
    CGContextSetLineWidth(context, 1.f);
    
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMinY(square1));
    CGContextAddArc(context, CGRectGetMaxX(square1), CGRectGetMaxY(square1), CGRectGetWidth(square1), M_PI, 0, YES);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square2), CGRectGetMaxY(square2));
    CGContextAddArc(context, CGRectGetMaxX(square2), CGRectGetMaxY(square2), CGRectGetWidth(square2), 0, M_PI, YES);
    CGContextStrokePath(context);
    
    NSString *testString = @"test";
    UIFont *font = [UIFont systemFontOfSize:20];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1, 1);
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowBlurRadius = 0.5;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor grayColor], NSForegroundColorAttributeName,
                                font,                NSFontAttributeName,
                                shadow,              NSShadowAttributeName, nil];
    CGSize textSize = [testString sizeWithAttributes:attributes];
    CGRect textRect = CGRectMake(CGRectGetMidX(square2) - textSize.width / 2, CGRectGetMidY(square2) - textSize.height / 2, textSize.width, textSize.height);
    textRect = CGRectIntegral(textRect);
    
    [testString drawInRect:textRect withAttributes:attributes];
    
//    [testString drawAtPoint:CGPointMake(CGRectGetMidX(square2) - textSize.width / 2, CGRectGetMidY(square2) - textSize.height / 2) withAttributes:attributes];
    
}


@end

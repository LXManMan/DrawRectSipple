//
//  PatternColored.m
//  DrawRectSipple
//
//  Created by chuanglong02 on 16/11/17.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "PatternColored.h"
#define H_PATTERN_SIZE 16

#define V_PATTERN_SIZE 18
@implementation PatternColored
-(instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    return self;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    CGContextRef myContext = [[NSGraphicsContext // 1
                               
                               currentContext] graphicsPort];
    MyColoredPatternPainting(myContext, dirtyRect);
    // Drawing code here.
}
void MyColoredPatternPainting (CGContextRef myContext,
                               
                               CGRect rect)

{
    
    CGPatternRef    pattern;// 1
    
    CGColorSpaceRef patternSpace;// 2
    
    CGFloat         alpha = 1,// 3
    
    width, height;// 4
    
    static const    CGPatternCallbacks callbacks = {0, // 5
        
        &MyDrawColoredPattern,
        
        NULL};
    
    
    
    CGContextSaveGState (myContext);
    
    patternSpace = CGColorSpaceCreatePattern (NULL);// 6
    
    CGContextSetFillColorSpace (myContext, patternSpace);// 7
    
    CGColorSpaceRelease (patternSpace);// 8
    
    
    
    pattern = CGPatternCreate (NULL, // 9
                               
                               CGRectMake (0, 0, H_PATTERN_SIZE, V_PATTERN_SIZE),// 10
                               
                               CGAffineTransformMake (1, 0, 0, 1, 0, 0),// 11
                               
                               H_PATTERN_SIZE, // 12
                               
                               V_PATTERN_SIZE, // 13
                               
                               kCGPatternTilingConstantSpacing,// 14
                               
                               true, // 15
                               
                               &callbacks);// 16
    
    
    
    CGContextSetFillPattern (myContext, pattern, &alpha);// 17
    
    CGPatternRelease (pattern);// 18
    
    CGContextFillRect (myContext, rect);// 19
    
    CGContextRestoreGState (myContext);
    
}
void MyDrawColoredPattern (void *info, CGContextRef myContext)

{
    
    CGFloat subunit = 5; // the pattern cell itself is 16 by 18
    
    
    
    CGRect  myRect1 = {{0,0}, {subunit, subunit}},
    
    myRect2 = {{subunit, subunit}, {subunit, subunit}},
    
    myRect3 = {{0,subunit}, {subunit, subunit}},
    
    myRect4 = {{subunit,0}, {subunit, subunit}};
    
    
    
    CGContextSetRGBFillColor (myContext, 0, 0, 1, 0.5);
    
    CGContextFillRect (myContext, myRect1);
    
    CGContextSetRGBFillColor (myContext, 1, 0, 0, 0.5);
    
    CGContextFillRect (myContext, myRect2);
    
    CGContextSetRGBFillColor (myContext, 0, 1, 0, 0.5);
    
    CGContextFillRect (myContext, myRect3);
    
    CGContextSetRGBFillColor (myContext, .5, 0, .5, 0.5);
    
    CGContextFillRect (myContext, myRect4);
    
}



@end

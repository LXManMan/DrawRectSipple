//
//  PatternStencil.m
//  DrawRectSipple
//
//  Created by chuanglong02 on 16/11/17.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "PatternStencil.h"
#define PSIZE 16    // size of the pattern cell
@implementation PatternStencil
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
    
//    Rect *windowRect =[
    MyStencilPatternPainting(myContext, dirtyRect);
    // Drawing code here.
}
void MyStencilPatternPainting (CGContextRef myContext,
                               
                               CGRect windowRect) //文档中为 const Rect*windowRect 还不熟悉mac 开发就将这个修改为CGRect类型

{
    
    CGPatternRef pattern;
    
    CGColorSpaceRef baseSpace;
    
    CGColorSpaceRef patternSpace;
    
    static const CGFloat color[4] = { 0, 1, 0, 1 };// 1
    
    static const CGPatternCallbacks callbacks = {0, &MyDrawStencilStar, NULL};// 2
    
    
    
    baseSpace = CGColorSpaceCreateDeviceRGB ();// 3
    
    patternSpace = CGColorSpaceCreatePattern (baseSpace);// 4
    
    CGContextSetFillColorSpace (myContext, patternSpace);// 5
    
    CGColorSpaceRelease (patternSpace);
    
    CGColorSpaceRelease (baseSpace);
    
    pattern = CGPatternCreate(NULL, CGRectMake(0, 0, PSIZE, PSIZE),// 6
                              
                              CGAffineTransformIdentity, PSIZE, PSIZE,
                              
                              kCGPatternTilingConstantSpacing,
                              
                              false, &callbacks);
    
    CGContextSetFillPattern (myContext, pattern, color);// 7
    
    CGPatternRelease (pattern);// 8
    
    CGContextFillRect (myContext,CGRectMake (0,0,PSIZE*20,PSIZE*20));// 9
    
}
static void MyDrawStencilStar (void *info, CGContextRef myContext)

{
    
    int k;
    
    double r, theta;
    
    
    
    r = 0.8 * PSIZE / 2;
    
    theta = 2 * M_PI * (2.0 / 5.0); // 144 degrees
    
    
    
    CGContextTranslateCTM (myContext, PSIZE/2, PSIZE/2);
    
    
    
    CGContextMoveToPoint(myContext, 0, r);
    
    for (k = 1; k < 5; k++) {
        
        CGContextAddLineToPoint (myContext,
                                 
                                 r * sin(k * theta),
                                 
                                 r * cos(k * theta));
        
    }
    
    CGContextClosePath(myContext);
    
    CGContextFillPath(myContext);
    
}



@end

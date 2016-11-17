//
//  MyQuartzView.m
//  DrawRectSipple
//
//  Created by chuanglong02 on 16/11/8.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "MyQuartzView.h"

@implementation MyQuartzView
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
    
    // ********** Your drawing code here ********** // 2
    
//    第一种：
//    CGContextSetRGBFillColor (myContext, 1, 0, 0, 1);// 3
//    
//    CGContextFillRect (myContext, CGRectMake (0, 0, 200, 100 ));// 4
//    
//    CGContextSetRGBFillColor (myContext, 0, 0, 1, .5);// 5
//    
//    CGContextFillRect (myContext, CGRectMake (0, 0, 100, 200));
//    
    // Drawing code here.
//    第二种：  使用位图上下文。
    CGRect myBoundingBox;// 1
    
    CGImageRef myImage;
    
    CGContextRef myBitmapContext;
    myBoundingBox = CGRectMake (0, 0, 500, 500);// 2
    
    myBitmapContext = MyCreateBitmapContext (400, 300);// 3
    
    // ********** Your drawing code here ********** // 4
    
    CGContextSetRGBFillColor (myBitmapContext, 1, 0, 0, 1);
    
    CGContextFillRect (myBitmapContext, CGRectMake (0, 0, 200, 100 ));
    
    CGContextSetRGBFillColor (myBitmapContext, 0, 0, 1, .5);
    
    CGContextFillRect (myBitmapContext, CGRectMake (0, 0, 100, 200 ));
    
    myImage = CGBitmapContextCreateImage (myBitmapContext);// 5
    
    CGContextDrawImage(myContext, myBoundingBox, myImage);// 6
    
    char *bitmapData = CGBitmapContextGetData(myBitmapContext); // 7
    
    CGContextRelease (myBitmapContext);// 8
    
    if (bitmapData) free(bitmapData); // 9
    
    CGImageRelease(myImage);
    
}
CGContextRef MyCreateBitmapContext (int pixelsWide,
                                    
                                    int pixelsHigh)

{
    
    CGContextRef    context = NULL;
    
    CGColorSpaceRef colorSpace;
    
    void *          bitmapData;
    
    int             bitmapByteCount;
    
    int             bitmapBytesPerRow;
    
    
    
    bitmapBytesPerRow   = (pixelsWide * 4);// 1
    
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    
    
    colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);// 2
    
    bitmapData = calloc( bitmapByteCount,bitmapByteCount );// 3
    
    if (bitmapData == NULL)
        
    {
        
        fprintf (stderr, "Memory not allocated!");
        
        return NULL;
        
    }
    
    context = CGBitmapContextCreate (bitmapData,// 4
                                     
                                     pixelsWide,
                                     
                                     pixelsHigh,
                                     
                                     8,      // bits per component
                                     
                                     bitmapBytesPerRow,
                                     
                                     colorSpace,
                                     
                                     kCGImageAlphaPremultipliedLast);
    
    if (context== NULL)
        
    {
        
        free (bitmapData);// 5
        
        fprintf (stderr, "Context not created!");
        
        return NULL;
        
    }
    
    CGColorSpaceRelease( colorSpace );// 6
    
    
    
    return context;// 7
    
}@end

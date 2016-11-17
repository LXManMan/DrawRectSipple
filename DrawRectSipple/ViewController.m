//
//  ViewController.m
//  DrawRectSipple
//
//  Created by chuanglong02 on 16/11/8.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "MyQuartzView.h"
#import "PatternColored.h"
#import "PatternStencil.h"
#import <CoreGraphics/CoreGraphics.h>
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
//    MyQuartzView *view =[[MyQuartzView alloc]initWithFrame:NSMakeRect(0, 0, 500, 500)];//位图
//    PatternColored *view =[[PatternColored alloc]initWithFrame:NSMakeRect(0, 0, 500, 500)];//pattern 有色类型
    PatternStencil *view =[[PatternStencil alloc]initWithFrame:NSMakeRect(0, 0, 100, 100)];
    [self.view addSubview:view];
    
//    [view.layer setBackgroundColor:[[NSColor brownColor] CGColor]];

    
    
    

}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

//
//  ViewController.m
//  Tarea3
//
//  Created by Silvestre Garcia on 9/16/17.
//  Copyright © 2017 silver. All rights reserved.
//

#import "Home.h"

@interface Home ()
{
    CGRect drawbox;
}

@property (nonatomic, strong) IBOutlet CircleView *cv;
@property (nonatomic, strong) UIBezierPath *circlePath;

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawCircle];
    [self.cv drawLineWithPath:self.circlePath];
}

-(void)drawCircle {
    CGFloat start = degreesToRadians(270);
    CGFloat end = degreesToRadians(630);
    CGPoint origin = CGPointMake(self.cv.frame.origin.x+4, self.cv.frame.origin.y+4);
    drawbox = CGRectMake(origin.x, origin.y, self.cv.frame.size.width-2, self.cv.frame.size.height-2);
    CGPoint midPoint = CGPointMake(CGRectGetWidth(drawbox)/2, CGRectGetWidth(drawbox)/2);
    CGFloat lineWidth = (CGRectGetWidth(drawbox)/2)*0.25;
    CGFloat radius = (CGRectGetWidth(drawbox)/2)-lineWidth/2-2;
    self.circlePath = [UIBezierPath bezierPathWithArcCenter:midPoint radius:radius startAngle:start endAngle:end clockwise:true];
    self.circlePath.lineWidth = lineWidth;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

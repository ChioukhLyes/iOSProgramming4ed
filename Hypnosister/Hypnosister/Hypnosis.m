//
//  Hypnosis.m
//  Hypnosister
//
//  Created by Chioukh Lyes on 03/04/2015.
//  Copyright (c) 2015 Excilys. All rights reserved.
//

#import "Hypnosis.h"

@interface Hypnosis ()
@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation Hypnosis

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    // Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    
    UIImage *logoImage = [UIImage imageNamed:@"gatling_logo.png"];
    
    // The circle will be the largest that will fit in the view
    //float radius = (MIN(bounds.size.width, bounds.size.height) / 2);
    
    // The largest circle will circumscribe the view
    float max = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // Add an arc to the path at center, with radius of radius,
    // from 0 to 2*PI radians (a circle)
//    [path addArcWithCenter:center radius:radius
//                startAngle:0.0
//                  endAngle:M_PI * 2.0
//                 clockwise:YES];
    
//configure line width to 10 points
    
    for (float currentRadius = max; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }

    
    path.lineWidth = 5;
    
    // Configure the drawing color to light gray
    //[[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    
    
    // Draw the line!
    [path stroke];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(8, 10), 1);
    //
    float width = bounds.size.width/2 - 200/2;
    float height = bounds.size.height/2 - 200/2;
    [logoImage drawInRect:CGRectMake(width,height,200,200)];
    
    
    CGContextRestoreGState(currentContext);

}


//ovveriding
// When a finger touches the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    // Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    self.circleColor = randomColor;
}



- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

@end

//
//  Canvas.m
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import "Canvas.h"
#import "NSBezierPath+Simplify.h"

@implementation Canvas

- (id)init
{
    self = [super init];
    if (self) {
        _paths = [[NSMutableArray alloc] initWithCapacity:3];
        _showPoints = YES;
        _simplify = YES;
    }
    
    return self;
}

- (void)dealloc
{
    [_paths release];
    
    [super dealloc];
}

- (void) beginPathAtLocation:(NSPoint)location withWidth:(CGFloat)width color:(NSColor *)color
{
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path setLineCapStyle:NSRoundLineCapStyle];
    [path setLineJoinStyle:NSRoundLineJoinStyle];
    [path setLineWidth:width];
    [path moveToPoint:location];
    NSDictionary *object = [NSDictionary dictionaryWithObjectsAndKeys:path, @"path", color, @"color", nil];
    [_paths addObject:object];
}

- (void) extendPathToLocation:(NSPoint)location
{
    NSDictionary *object = [_paths lastObject];
    NSBezierPath *path = [object objectForKey:@"path"];
    [path lineToPoint:location];
}

- (void) endPath
{
    NSDictionary *object = [_paths lastObject];
    NSBezierPath *path = [object objectForKey:@"path"];
    NSInteger originalCount = [path elementCount];
    
    if ( _simplify ) {
        path = [path fb_simplify:1];
        NSMutableDictionary *newObject = [[object mutableCopy] autorelease];
        [newObject setObject:path forKey:@"path"];
        [_paths replaceObjectAtIndex:[_paths indexOfObject:object] withObject:newObject];
    }
    
    NSLog(@"path has %ld elements, down from %ld", [path elementCount], originalCount);
}

- (void) drawRect:(NSRect)dirtyRect
{
    // Draw on a background
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:dirtyRect];
    
    // Draw on the objects
    for (NSDictionary *object in _paths) {
        NSColor *color = [object objectForKey:@"color"];
        NSBezierPath *path = [object objectForKey:@"path"];
        [color set];
        [path stroke];
    }
    
    if ( _showPoints ) {
        for (NSDictionary *object in _paths) {
            NSBezierPath *path = [object objectForKey:@"path"];
            [[NSColor orangeColor] set];
            [NSBezierPath setDefaultLineWidth:1.0];
            [NSBezierPath setDefaultLineCapStyle:NSButtLineCapStyle];
            [NSBezierPath setDefaultLineJoinStyle:NSMiterLineJoinStyle];
            
            for (NSInteger i = 0; i < [path elementCount]; i++) {
                NSPoint points[3] = {};
                [path elementAtIndex:i associatedPoints:points];
                NSRect handleFrame = NSMakeRect(floorf(points[0].x - 2) - 0.5, floorf(points[0].y - 2) - 0.5, 5, 5);
                [NSBezierPath strokeRect:handleFrame];
            }
        }
    }
}

@end

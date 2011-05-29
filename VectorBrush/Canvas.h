//
//  Canvas.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Canvas : NSObject {
    NSMutableArray *_paths;
    BOOL _showPoints;
    BOOL _simplify;
}

- (void) beginPathAtLocation:(NSPoint)location withWidth:(CGFloat)width color:(NSColor *)color;
- (void) extendPathToLocation:(NSPoint)location;
- (void) endPath;

- (void) drawRect:(NSRect)dirtyRect;

@end

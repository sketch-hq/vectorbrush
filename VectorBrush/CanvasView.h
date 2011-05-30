//
//  CanvasView.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Canvas;
@class Brush;

@interface CanvasView : NSView {
    Canvas *_canvas;
    Brush *_brush;
}

@property BOOL showPoints;
@property BOOL simplify;
@property BOOL fitCurve;

@end

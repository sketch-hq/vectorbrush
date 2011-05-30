//
//  CanvasView.m
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import "CanvasView.h"
#import "Canvas.h"
#import "Brush.h"

@implementation CanvasView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _canvas = [[Canvas alloc] init];
        _brush = [[Brush alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [_canvas release];
    [_brush release];
    
    [super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [_canvas drawRect:dirtyRect];
}

- (void)mouseDown:(NSEvent *)theEvent
{
	// Simply pass the mouse event to the brush. Also give it the canvas to
	//	work on, and a reference to ourselves, so it can translate the mouse
	//	locations.
	[_brush mouseDown:theEvent inView:self onCanvas:_canvas];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
	// Simply pass the mouse event to the brush. Also give it the canvas to
	//	work on, and a reference to ourselves, so it can translate the mouse
	//	locations.	
	[_brush mouseDragged:theEvent inView:self onCanvas:_canvas];
}

- (void)mouseUp:(NSEvent *)theEvent
{
	// Simply pass the mouse event to the brush. Also give it the canvas to
	//	work on, and a reference to ourselves, so it can translate the mouse
	//	locations.	
	[_brush mouseUp:theEvent inView:self onCanvas:_canvas];
}

- (BOOL) showPoints
{
    return _canvas.showPoints;
}

- (void) setShowPoints:(BOOL)showPoints
{
    _canvas.showPoints = showPoints;
}

- (BOOL) simplify
{
    return _canvas.simplify;
}

- (void) setSimplify:(BOOL)simplify
{
    _canvas.simplify = simplify;
}

- (BOOL) fitCurve
{
    return _canvas.fitCurve;
}

- (void) setFitCurve:(BOOL)fitCurve
{
    _canvas.fitCurve = fitCurve;
}

@end

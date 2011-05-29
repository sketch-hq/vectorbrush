//
//  Brush.m
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import "Brush.h"
#import "Canvas.h"

@interface Brush ()

- (NSPoint) canvasLocation:(NSEvent *)theEvent view:(NSView *)view;

@end

@implementation Brush

- (id)init
{
    self = [super init];
    if (self) {
        _diameter = 20.0;
        _color = [[NSColor blueColor] retain];
    }
    
    return self;
}

- (void)dealloc
{
    [_color release];
    
    [super dealloc];
}

- (void) mouseDown:(NSEvent *)theEvent inView:(NSView *)view onCanvas:(Canvas *)canvas
{
	// Translate the event point location into a canvas point
	NSPoint currentPoint = [self canvasLocation:theEvent view:view];
    
	[canvas beginPathAtLocation:currentPoint withWidth:_diameter color:_color];
    
	// This isn't very efficient, but we need to tell the view to redraw. A better
	//	version would have the canvas itself to generate an invalidate for the view
	//	(since it knows exactly where the bits changed).	
	[view setNeedsDisplay:YES];
}

- (void) mouseDragged:(NSEvent *)theEvent inView:(NSView *)view onCanvas:(Canvas *)canvas
{
	// Translate the event point location into a canvas point
	NSPoint currentPoint = [self canvasLocation:theEvent view:view];

	[canvas extendPathToLocation:currentPoint];
    
	// This isn't very efficient, but we need to tell the view to redraw. A better
	//	version would have the canvas itself to generate an invalidate for the view
	//	(since it knows exactly where the bits changed).	
	[view setNeedsDisplay:YES];
}

- (void) mouseUp:(NSEvent *)theEvent inView:(NSView *)view onCanvas:(Canvas *)canvas
{
	// Translate the event point location into a canvas point
	NSPoint currentPoint = [self canvasLocation:theEvent view:view];
	
    [canvas extendPathToLocation:currentPoint];
    [canvas endPath];    
    
	// This isn't very efficient, but we need to tell the view to redraw. A better
	//	version would have the canvas itself to generate an invalidate for the view
	//	(since it knows exactly where the bits changed).	
	[view setNeedsDisplay:YES];
}

- (NSPoint) canvasLocation:(NSEvent *)theEvent view:(NSView *)view
{
	// Currently we assume that the NSView here is a CanvasView, which means
	//	that the view is not scaled or offset. i.e. There is a one to one
	//	correlation between the view coordinates and the canvas coordinates.
	NSPoint eventLocation = [theEvent locationInWindow];
	return [view convertPoint:eventLocation fromView:nil];
}

@end

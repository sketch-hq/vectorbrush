//
//  NSBezierPath+Utilities.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/28/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSBezierPath (FBUtilities)

- (NSPoint) fb_pointAtIndex:(NSUInteger)index;
- (NSBezierPath *) fb_subpathWithRange:(NSRange)range;

- (void) fb_copyAttributesFrom:(NSBezierPath *)path;
- (void) fb_appendPath:(NSBezierPath *)path;

@end

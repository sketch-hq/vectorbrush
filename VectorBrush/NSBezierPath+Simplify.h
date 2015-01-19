//
//  NSBezierPath+Simplify.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSBezierPath (Simplify)

- (NSBezierPath *) fb_simplify:(CGFloat)threshold;

@end

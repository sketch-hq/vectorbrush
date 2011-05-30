//
//  Geometry.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/28/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


CGFloat NSDistanceBetweenPoints(NSPoint point1, NSPoint point2);
CGFloat NSDistancePointToLine(NSPoint point, NSPoint lineStartPoint, NSPoint lineEndPoint);

NSPoint NSAddPoint(NSPoint point1, NSPoint point2);
NSPoint NSUnitScalePoint(NSPoint point, CGFloat scale);
NSPoint NSScalePoint(NSPoint point, CGFloat scale);
NSPoint NSSubtractPoint(NSPoint point1, NSPoint point2);
CGFloat NSDotMultiplyPoint(NSPoint point1, NSPoint point2);
CGFloat NSPointLength(NSPoint point);
CGFloat NSPointSquaredLength(NSPoint point);
NSPoint NSNormalizePoint(NSPoint point);

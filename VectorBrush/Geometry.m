//
//  Geometry.m
//  VectorBrush
//
//  Created by Andrew Finnell on 5/28/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import "Geometry.h"


CGFloat NSDistanceBetweenPoints(NSPoint point1, NSPoint point2)
{
    CGFloat xDelta = point2.x - point1.x;
    CGFloat yDelta = point2.y - point1.y;
    return sqrtf(xDelta * xDelta + yDelta * yDelta);
}

CGFloat NSDistancePointToLine(NSPoint point, NSPoint lineStartPoint, NSPoint lineEndPoint)
{
    CGFloat lineLength = NSDistanceBetweenPoints(lineStartPoint, lineEndPoint);
    if ( lineLength == 0 )
        return 0;
    CGFloat u = ((point.x - lineStartPoint.x) * (lineEndPoint.x - lineStartPoint.x) + (point.y - lineStartPoint.y) * (lineEndPoint.y - lineStartPoint.y)) / (lineLength * lineLength);
    NSPoint intersectionPoint = NSMakePoint(lineStartPoint.x + u * (lineEndPoint.x - lineStartPoint.x), lineStartPoint.y + u * (lineEndPoint.y - lineStartPoint.y));
    return NSDistanceBetweenPoints(point, intersectionPoint);
}

NSPoint NSAddPoint(NSPoint point1, NSPoint point2)
{
    return NSMakePoint(point1.x + point2.x, point1.y + point2.y);
}

NSPoint NSUnitScalePoint(NSPoint point, CGFloat scale)
{
    NSPoint result = point;
    CGFloat length = NSPointLength(point);
    if ( length != 0.0 ) {
        result.x *= scale/length;
        result.y *= scale/length;
    }
    return result;
}

NSPoint NSScalePoint(NSPoint point, CGFloat scale)
{
    return NSMakePoint(point.x * scale, point.y * scale);
}

CGFloat NSDotMultiplyPoint(NSPoint point1, NSPoint point2)
{
    return point1.x * point2.x + point1.y * point2.y;
}

NSPoint NSSubtractPoint(NSPoint point1, NSPoint point2)
{
    return NSMakePoint(point1.x - point2.x, point1.y - point2.y);
}

CGFloat NSPointLength(NSPoint point)
{
    return sqrtf((point.x * point.x) + (point.y * point.y));
}

CGFloat NSPointSquaredLength(NSPoint point)
{
    return (point.x * point.x) + (point.y * point.y);
}

NSPoint NSNormalizePoint(NSPoint point)
{
    NSPoint result = point;
    CGFloat length = NSPointLength(point);
    if ( length != 0.0 ) {
        result.x /= length;
        result.y /= length;
    }
    return result;
}

NSPoint NSNegatePoint(NSPoint point)
{
    return NSMakePoint(-point.x, -point.y);
}

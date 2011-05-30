//
//  MyDocument.h
//  VectorBrush
//
//  Created by Andrew Finnell on 5/27/11.
//  Copyright 2011 Fortunate Bear, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CanvasView;

@interface MyDocument : NSDocument {
@private
    IBOutlet CanvasView *_view;
}

- (IBAction) toggleShowPoints:(id)sender;
- (IBAction) toggleSimplifyPath:(id)sender;
- (IBAction) toggleFitCurve:(id)sender;

@end

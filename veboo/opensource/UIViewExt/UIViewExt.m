//
//  UIView+ViewFrameGeometry.m
//  weibo
//
//  Created by And.He on 13-5-11.
//  Copyright (c) 2013年 He.Qingbao. All rights reserved.
//

#import "UIViewExt.h"

CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint center;
    center.x = CGRectGetMinX(rect);
    center.y = CGRectGetMidY(rect);
    return center;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newRect;
    newRect.origin.x = center.x - CGRectGetMidX(rect);
    newRect.origin.y = center.y - CGRectGetMidY(rect);
    newRect.size = rect.size;
    return newRect;
}

@implementation UIView (ViewFrameGeometry)

// Override set and get the origin
- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)aPoint
{
    CGRect newFrame = self.frame;
    newFrame.origin = aPoint;
    self.frame = newFrame;
}

// Override set and get the size
- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)aSize
{
    CGRect newFrame = self.frame;
    newFrame.size = aSize;
    self.frame = newFrame;
}

// Override set and get width, height
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)newWidth
{
    CGRect newFrame = self.frame;
    newFrame.size.width = newWidth;
    self.frame = newFrame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newHeight
{
    CGRect newFrame = self.frame;
    newFrame.size.height = newHeight;
    self.frame = newFrame;
}

// Override set and get left, top, right, bottom
- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)newLeft
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = newLeft;
    self.frame = newFrame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newTop
{
    CGRect newFrame = self.frame;
    newFrame.origin.y = newTop;
    self.frame = newFrame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)newRight
{
    CGRect newFrame = self.frame;
    newFrame.origin.x = newRight - self.frame.size.width;
    self.frame = newFrame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)newBottom
{
    CGRect newFrame = self.frame;
    newFrame.origin.y = newBottom - self.frame.size.height;
    self.frame = newFrame;
}

// Query other frame locations
- (CGPoint)topLeft
{
    float x = self.frame.origin.x;
    float y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (CGPoint)topRight
{
    float x = self.frame.origin.x + self.frame.size.width;
    float y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (CGPoint)bottomLeft
{
    float x = self.frame.origin.x;
    float y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)bottomRight
{
    float x = self.frame.origin.x + self.frame.size.width;
    float y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

// Move via offset
- (void)moveBy:(CGPoint)delta
{
    CGPoint newCenter = self.center;
    newCenter.x = delta.x;
    newCenter.y = delta.y;
    self.center = newCenter;
}

// Scaling
- (void)scaleBy:(CGFloat)scaleFactor
{
    CGRect newFrame = self.frame;
    newFrame.size.width *= scaleFactor;
    newFrame.size.height *= scaleFactor;
    self.frame = newFrame;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void)fitInSize:(CGSize)aSize
{
    CGFloat scale;
    CGRect newFrame = self.frame;
    
    if (newFrame.size.width && (newFrame.size.width >= aSize.width)) {
        scale = aSize.width / newFrame.size.width;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }
    
    if (newFrame.size.height && (newFrame.size.height >= aSize.height)) {
        scale = aSize.height / newFrame.size.height;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }
    
    self.frame = newFrame;
}

@end

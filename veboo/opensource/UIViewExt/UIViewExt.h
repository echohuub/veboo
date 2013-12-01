//
//  UIView+ViewFrameGeometry.h
//  weibo
//
//  Created by And.He on 13-5-11.
//  Copyright (c) 2013年 He.Qingbao. All rights reserved.
//

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)

@property CGPoint origin;
@property CGSize size;

@property(readonly) CGPoint topLeft;
@property(readonly) CGPoint topRight;
@property(readonly) CGPoint bottomLeft;
@property(readonly) CGPoint bottomRight;


@property CGFloat width;
@property CGFloat height;

@property CGFloat left;
@property CGFloat top;
@property CGFloat right;
@property CGFloat bottom;

- (void)moveBy:(CGPoint)delta;
- (void)scaleBy:(CGFloat)scaleFactor;
- (void)fitInSize:(CGSize)aSize;

@end

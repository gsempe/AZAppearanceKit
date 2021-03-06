//
//  AZDrawingFunctions.m
//  AZAppearanceKit
//
//  Created by Victor Pena Placer on 2/28/12.
//  Copyright (c) 2012 Victor Pena Placer. All rights reserver.
//  Copyright (c) 2012 Alexsander Akers & Zachary Waldowski. All rights reserved.
//

#import "AZDrawingFunctions.h"

void CGContextStrokeRectEdge(CGContextRef ctx, CGRect rect, CGRectEdge edge) {
	CGFloat minX, maxX, minY, maxY;
	switch (edge) {
		case CGRectMinXEdge:
			minX = CGRectGetMinX(rect);
			minY = CGRectGetMinY(rect);
			maxX = CGRectGetMinX(rect);
			maxY = CGRectGetMaxY(rect);
			break;
		case CGRectMinYEdge:
			minX = CGRectGetMinX(rect);
			minY = CGRectGetMinY(rect);
			maxX = CGRectGetMaxX(rect);
			maxY = CGRectGetMinY(rect);
			break;
		case CGRectMaxXEdge:
			minX = CGRectGetMaxX(rect);
			minY = CGRectGetMinY(rect);
			maxX = CGRectGetMaxX(rect);
			maxY = CGRectGetMaxY(rect);
			break;
		case CGRectMaxYEdge:
			minX = CGRectGetMinX(rect);
			minY = CGRectGetMaxY(rect);
			maxX = CGRectGetMaxX(rect);
			maxY = CGRectGetMaxY(rect);
			break;
	}
	
    CGContextMoveToPoint(ctx, minX, minY);
    CGContextAddLineToPoint(ctx, maxX, maxY);
	CGContextStrokePath(ctx);
}

extern CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerRadius) {
    return CGPathCreateByRoundingCornersInRect(rect, cornerRadius, cornerRadius, cornerRadius, cornerRadius);
}

extern CGPathRef CGPathCreateByRoundingCornersInRect(CGRect rect, CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomLeftRadius, CGFloat bottomRightRadius) {
    CGPoint minPoint = rect.origin;
    CGPoint maxPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect));

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, minPoint.x + topLeftRadius, minPoint.y);
    CGPathAddArcToPoint(path, NULL, maxPoint.x, minPoint.y, maxPoint.x, minPoint.y + topRightRadius, topRightRadius);
    CGPathAddArcToPoint(path, NULL, maxPoint.x, maxPoint.y, maxPoint.x - bottomRightRadius, maxPoint.y, bottomRightRadius);
    CGPathAddArcToPoint(path, NULL, minPoint.x, maxPoint.y, minPoint.x, maxPoint.y - bottomLeftRadius, bottomLeftRadius);
    CGPathAddArcToPoint(path, NULL, minPoint.x, minPoint.y, minPoint.x + topLeftRadius, minPoint.y, topLeftRadius);
    CGPathCloseSubpath(path);
    return path;
}

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED

void UIGraphicsContextPerformBlock(void (^block)(CGContextRef)) {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSaveGState(ctx);
	block(ctx);
	CGContextRestoreGState(ctx);
}

void UIRectStrokeWithColor(CGRect rect, CGRectEdge edge, CGFloat width, UIColor *color) {
    UIGraphicsContextPerformBlock(^(CGContextRef ctx) {
        CGContextSetStrokeColorWithColor(ctx, color.CGColor);
        CGContextSetLineWidth(ctx, width);
        CGContextStrokeRectEdge(ctx, rect, edge);
    });
}

#endif
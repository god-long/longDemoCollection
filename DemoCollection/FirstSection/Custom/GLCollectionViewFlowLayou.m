//
//  GLCollectionViewFlowLayou.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/28.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "GLCollectionViewFlowLayou.h"

@implementation GLCollectionViewFlowLayou

//可以在此方法中设置你的layout
- (void)prepareLayout {
    //必须调用super
    [super prepareLayout];
}

//在这里改变布局 滑动时会时时调用此方法
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    //拿到rect里面cell的所有布局
    NSArray *tempArray = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *replaceArray = [NSMutableArray arrayWithCapacity:tempArray.count];
    //改变每一个数组中的每一个布局
    for (NSInteger i = 0; i < tempArray.count; i++) {
        
        UICollectionViewLayoutAttributes *layoutAttri = [[tempArray objectAtIndex:i] copy];
        
        CGFloat distanceToCenter = fabs(layoutAttri.center.x - self.collectionView.contentOffset.x - CGRectGetWidth(self.collectionView.frame) / 2);
        CGFloat scale = 0.5;
        CGFloat w = (self.collectionView.frame.size.width + self.itemSize.width) * 0.5;
        
        if (distanceToCenter >= w) {
            scale = 0.5;
        }else{
            scale = scale +  (1- distanceToCenter / w ) * 0.5;
        }
        //缩放 && 旋转角度
        CGAffineTransform transformScale = CGAffineTransformMakeScale(scale, scale);
        layoutAttri.transform = CGAffineTransformRotate(transformScale, M_PI_4 / 4);
      
        [replaceArray addObject:layoutAttri];
    }
    
    return replaceArray;
}

//替换最终滑动的contentOffset, proposedContentOffset是预期滑动停止的位置
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGRect rect = self.collectionView.bounds;
    rect.size.width = self.collectionView.frame.size.width + self.itemSize.width;
    rect.origin.x = proposedContentOffset.x - self.itemSize.width;
    rect.origin.y = proposedContentOffset.y;
    rect.origin = proposedContentOffset;
    
    NSArray *attriArray = [super layoutAttributesForElementsInRect:rect];
    CGFloat distance = 1000;
    
    //距离中心点绝对值最近的距离 在左边是负
    CGFloat minDistance = 0.0;
    
    for (NSInteger i = 0; i < attriArray.count; i++) {
        
        UICollectionViewLayoutAttributes *layoutAttri = [attriArray objectAtIndex:i];
        CGFloat attriDistance = layoutAttri.center.x - proposedContentOffset.x - CGRectGetWidth(self.collectionView.frame) / 2;
        
        if (fabs(attriDistance) < distance) {
            distance = fabs(attriDistance);
            minDistance = attriDistance;
        }
    }
    
    //替换希望的contentOffset
    CGPoint actualPoint = CGPointMake(proposedContentOffset.x + minDistance, proposedContentOffset.y);
    
    //处理第一个 和 最后一个的contentOffset
    CGFloat minContentOffsetX = -floor(self.collectionView.contentInset.left);
    CGFloat maxContentOffsetX = floor(self.collectionView.contentSize.width - CGRectGetWidth(self.collectionView.frame) + self.collectionView.contentInset.right);
    actualPoint = actualPoint.x < minContentOffsetX ? CGPointMake(minContentOffsetX, actualPoint.y) : actualPoint;
    actualPoint = actualPoint.x > maxContentOffsetX ? CGPointMake(maxContentOffsetX, actualPoint.y) : actualPoint;
    return actualPoint;
}

// 当collectionView改变时，是否重新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


@end

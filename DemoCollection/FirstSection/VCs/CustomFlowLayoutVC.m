//
//  CustomFlowLayoutVC.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/28.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "CustomFlowLayoutVC.h"
#import "CustomFlowLayoutCell.h"
#import "GLCollectionViewFlowLayou.h"
#import "FirstSectionViewModel.h"

@interface CustomFlowLayoutVC () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak  ) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) FirstSectionViewModel *viewModel;

@end

@implementation CustomFlowLayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = [[FirstSectionViewModel alloc] init];
    
    
    [self configCollectionView];
}

#pragma mark - System Methods


#pragma mark - Privite Methods

- (void)configCollectionView {
    
    GLCollectionViewFlowLayou *flowLayout = [[GLCollectionViewFlowLayou alloc] init];
    flowLayout.itemSize = CGSizeMake(kScreenWidth * 1 / 2, CGRectGetHeight(self.collectionView.frame) - 60);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 10;
    
    self.collectionView.collectionViewLayout = flowLayout;
    CGFloat left = CGRectGetWidth(self.collectionView.frame) / 2 - flowLayout.itemSize.width / 2;
    _collectionView.contentInset = UIEdgeInsetsMake(0, left, 0, left);
    [_collectionView registerNib:[UINib nibWithNibName:@"CustomFlowLayoutCell" bundle:nil] forCellWithReuseIdentifier:@"CustomFlowLayoutCell"];
    [_collectionView reloadData];
    
    [_collectionView setContentOffset:CGPointMake(-left, 0) animated:YES];
}


#pragma mark - Delegate

#pragma mark UICollectionViewDataSource && UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.customFlowLayoutArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomFlowLayoutCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomFlowLayoutCell" forIndexPath:indexPath];
    NSString *imageName = [[self.viewModel.customFlowLayoutArray objectAtIndex:indexPath.item] objectForKey:kConfigImage];
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"JPG"];
    cell.contentImageView.image = [UIImage imageWithContentsOfFile:path];
    cell.backgroundColor = RandomColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}



#pragma makr - ReceiveMemoryWarn
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

//
//  ViewController.m
//  PageScrollView
//
//  Created by Benster on 15/9/25.
//  Copyright © 2015年 Benster. All rights reserved.
//

#import "ViewController.h"
#import "ImagesCircleView.h"

#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width

@interface ViewController () <ImagesCircleViewDelegate>

@property (nonatomic, strong) ImagesCircleView *imageCicleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.imageCicleView];
}

#pragma mark - Getter _imageCicleView
- (ImagesCircleView *)imageCicleView {
    if (!_imageCicleView) {
        _imageCicleView = [[ImagesCircleView alloc] initWithFrame:CGRectMake(0, 22, kScreen_Width, 200)];
        _imageCicleView.pagingEnabled = YES;
        _imageCicleView.backgroundColor = [UIColor colorWithRed:0xf9/255.0 green:0xf9/255.0 blue:0xfa/255.0 alpha:1];
        _imageCicleView.showsHorizontalScrollIndicator = NO;
        _imageCicleView.bounces = NO;
        _imageCicleView.scrollsToTop = NO;
        _imageCicleView.imagesCircleDelegate = self;
        
        _imageCicleView.imageInfos = @[@"event_change_banner", @"image_default"];;
        
        /**
         *  轮询时间间隔 设置为0自动停止
         */
        _imageCicleView.duration = 2;
    }
    
    return _imageCicleView;
}

#pragma mark - delegate
#pragma mark - did Tap
- (void)scrollImagesDidSelectItemInfo:(id)info {
    NSLog(@"%@ did Tap", info);
}

#pragma mark - dataSours
- (void)scrollImagesFromImageView:(UIImageView *)imageView info:(id)info {
    imageView.image = [UIImage imageNamed:info];
}


@end

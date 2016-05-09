//
//  ScanCodeVC.m
//  DemoCollection
//
//  Created by 许龙 on 16/4/20.
//  Copyright © 2016年 许龙. All rights reserved.
//

#import "ScanCodeVC.h"
#import <AVFoundation/AVFoundation.h>

@interface ScanCodeVC () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *captureSession;

@property (nonatomic, strong) AVCaptureMetadataOutput *captureOutput;

@property (nonatomic, strong) UIImageView *sweepLineView;/**< 扫描条 */


@end

@implementation ScanCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫码";
    
    if (![self authJudge]) {
        return;
    }
    
    AVCaptureDevice  *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *captureInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:nil];
    self.captureOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    self.captureSession = [[AVCaptureSession alloc] init];
    [_captureSession setSessionPreset:AVCaptureSessionPresetHigh];
    
    if ([_captureSession canAddInput:captureInput]) {
        [_captureSession addInput:captureInput];
    }
    
    if ([_captureSession canAddOutput:_captureOutput]) {
        [_captureSession addOutput:_captureOutput];
    }
    
    _captureOutput.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
    
    CGRect rect = CGRectMake((kScreenWidth - 250) / 2, (kScreenHeight - 250 - 72)/2, 250, 250);
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
    previewLayer.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:previewLayer];
    
    _captureOutput.rectOfInterest = [previewLayer metadataOutputRectOfInterestForRect:rect];
    [_captureSession startRunning];
    
    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64)];
    maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    [self.view addSubview:maskView];
    
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    //    [rectPath appendPath:[[UIBezierPath bezierPathWithRect:CM((SCREEN_WIDTH - 250) / 2, 66, 250, 250)] bezierPathByReversingPath]];
    [rectPath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake((kScreenWidth - 250) / 2, (kScreenHeight - 250 - 72)/2 - 64, 250, 250) cornerRadius:1] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = rectPath.CGPath;
    
    maskView.layer.mask = shapeLayer;
    
    UIImageView *scanAreaImageView = [[UIImageView alloc] initWithFrame:rect];
    scanAreaImageView.image = [UIImage imageNamed:@"scan_code_frame"];
    scanAreaImageView.layer.cornerRadius = 2;
    scanAreaImageView.layer.borderColor = [UIColor orangeColor].CGColor;
    scanAreaImageView.layer.borderWidth = 1;
    [self.view addSubview:scanAreaImageView];
    
    self.sweepLineView = [[UIImageView alloc] initWithFrame:CGRectMake(1, 20, 248, 2)];
    _sweepLineView.image = [UIImage imageNamed:@"scan_code_line"];
    _sweepLineView.backgroundColor = [UIColor redColor];
    [scanAreaImageView addSubview:_sweepLineView];

    //开始动画
    [self sweepAnimation];
}

#pragma mark - System Methods



#pragma mark - Privite Methods

- (BOOL)authJudge {
    if ([[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] count] <= 0) {
        NSLog(@"没有相机");
        return NO;
    }
    
    if([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo] == AVAuthorizationStatusDenied) {
        NSLog(@"没有权限");
        return NO;
    }
    return YES;
}

- (void)sweepAnimation {
    //添加扫码动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2.0f];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:10000];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    _sweepLineView.frame = CGRectMake(CGRectGetMinX(_sweepLineView.frame), 230, CGRectGetWidth(_sweepLineView.frame), CGRectGetHeight(_sweepLineView.frame));
    
    [UIView commitAnimations];
}



#pragma mark - Delegate

#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
   
    if (metadataObjects.count > 0) {
        NSLog(@"%@",[[metadataObjects objectAtIndex:0] stringValue]);
    }
}




#pragma makr - ReceiveMemoryWarn
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

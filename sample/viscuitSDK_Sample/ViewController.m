//
//  ViewController.h
//  viscuitSDK_Sample_1.1.0
//
//  Created by yuhwanni on 2016. 11. 02..
//  Copyright © 2016년 yuhwanni. All rights reserved.
//

#import "ViewController.h"
#import "Toast.h"
#import "VSTimerLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet VSTimerLabel *mVSTimer;
@property (weak, nonatomic) IBOutlet UILabel *mVSVersion;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // AppDelegate에 한번 선언하시는것이 좋습니다.
    [ViscuitSDK init:@"viscuit" slotCode:@"test_ads"];
    
    // 개발, 상용 환경 설정 ( true : 샘플 / false : 상용 )
    // 해당 메소드는 샘플 광고만 노출 되도록 합니다.
    [ViscuitSDK setDevType:YES];
    [ViscuitSDK delegate:self];
    
    
    
    //타이머에 기본 문구 설정
    _mVSTimer.defaultText = @"권장 요청 샘플";
    
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(onViscuitTimerShow)];
    
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    _mVSTimer.userInteractionEnabled = YES;
    [_mVSTimer addGestureRecognizer:tapGestureRecognizer];
    
    
    // 버전 문구 
    self.mVSVersion.text = [NSString stringWithFormat:@"비스킷 SDK : %@", [ViscuitSDK getSDKVersion]];
}


- (IBAction)onViscuitInitClick:(id)sender {
    // AppDelegate에 didFinishLaunchingWithOptions에 최초 한번 실행호출하는것이 효율적입니다.
    [ViscuitSDK init:@"mediaCode를 넣어주세요" slotCode:@"slot Code를 넣어주세요"];
}


- (IBAction)onViscuitReload:(id)sender {
    // 뷰가 노출 되는 시점에 광고정보를 갱신하기에 적합합니다.
    //[ViscuitSDK reloadAdStatus];
    
    // 최신 광고 상태를 가져오는 시점에 콜백을 받을수 있습니다.
    [ViscuitSDK reloadAdStatus:^{
        [self onViscuitAdCheck:sender];
    }];

}

- (IBAction)onViscuitAdCheck:(id)sender {
    // 광고 체크
    if([ViscuitSDK isAdReady]) {
        [self.view makeToast:@"AD READY"];
    } else {
        [self.view makeToast:@"NOAD"];
    }
}


- (void) onViscuitTimerShow {
    //광고 보기
    [ViscuitSDK viscuitShow:self];
}


/*
 Callback Message Type
 Success : 광고 시청 완료 (리워드 지급 조건) Skip : 광고 시청중 Skip 클릭
 Noad : 광고 없음
 Error : SDK 사용 Error
 */
//Callback 함수 작성
- (void) viscuitCallBack:(enum ViscuitResult) v_result {
    switch (v_result) {
        case SUCCESS:
            NSLog(@"Viscuit 광고 정상 시청 완료");
            [self.view makeToast:@"SUCCESS"];
            [self startVSTimer];
            break;
        case NOAD:
            NSLog(@"Viscuit 가용 광고 없음");
            [self.view makeToast:@"NOAD"];
            break;
        case ERROR:
            NSLog(@"네트워크 에러 등 정상적이지 않은 경우");
            [self.view makeToast:@"ERROR"];
            break;
        case SKIP:
            NSLog(@"Viscuit 광고 스킵");
            [self.view makeToast:@"SKIP"];
            [self startVSTimer];
            break;
        default:
            break;
    }
}


-(void) startVSTimer {
    if(self.mVSTimer != nil) {
        // 광고 시청 후에 일정시간 시청을 하지 못하게 한다.
        [self.mVSTimer setCountDownTime:10];
        [self.mVSTimer start];
    }
}


@end

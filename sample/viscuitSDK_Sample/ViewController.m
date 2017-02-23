//
//  ViewController.h
//  viscuitSDK_Sample_1.1.0
//
//  Created by yuhwanni on 2016. 11. 02..
//  Copyright © 2016년 yuhwanni. All rights reserved.
//

#import "ViewController.h"
#import "Toast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ViscuitSDK delegate:self];
}

- (IBAction)viscuitAdPlay:(UIButton *)sender {
    //광고 재생
    [ViscuitSDK viscuitShow:self];
}


- (IBAction)viscuitAdCheck:(id)sender {
    //광고 체크
    
    [ViscuitSDK checkAdStatus];
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
            break;
        case CHECK_NOAD:
            NSLog(@"Viscuit 체크 광고 없음");
            break;
        case CHECK_ADREADY:
            NSLog(@"Viscuit 체크 광고 준비됨.");
            break;
        default:
            break;
    }
    
}


@end

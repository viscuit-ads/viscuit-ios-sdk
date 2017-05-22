//
//  ViscuitSDK.h
//  viscuitSDK_Dev_Sample
//
//  Created by KangHo Lee on 2016. 12. 21..
//  Copyright © 2016년 seokjun lee. All rights reserved.
//

#import <UIKit/UIKit.h>

enum ViscuitResult {
    SUCCESS,
    NOAD,
    ERROR,
    SKIP
};

@protocol ViscuitDelegate <NSObject>
- (void) viscuitCallBack:(enum ViscuitResult) result;
@end

@interface ViscuitSDK : NSObject

+ (void) init:(NSString * ) mediaCode slotCode:(NSString *) slotCode categories:(NSArray *) categories;
+ (void) init:(NSString * ) mediaCode slotCode:(NSString *) slotCode;
+ (void) setDevType:(BOOL) isDevType;
+ (void) viscuitShow:(UIViewController *) mainController;
+ (void) delegate:(id<ViscuitDelegate>) delegate;
+ (void) reloadAdStatus;
+ (void) reloadAdStatus:(void (^)())callback;
+ (BOOL) isAdReady;
+ (NSString *) getSDKVersion;
+ (void) setSDKVersion:(NSString *) version;

@property (nonatomic, weak) id <ViscuitDelegate> delegate;

@end

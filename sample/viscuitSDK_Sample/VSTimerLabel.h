//
//  TimerCell.h
//  viscuitSDK_Dev_Sample
//
//  Created by KangHo Lee on 2017. 5. 11..
//  Copyright © 2017년 seokjun lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZTimerLabel.h"

@interface VSTimerLabel : MZTimerLabel <MZTimerLabelDelegate>

-(void) setDefaultText:(NSString *)text;

-(void) start;

@end

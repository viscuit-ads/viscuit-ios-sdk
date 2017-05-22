//
//  TimerCell.m
//  viscuitSDK_Dev_Sample
//
//  Created by KangHo Lee on 2017. 5. 11..
//  Copyright © 2017년 seokjun lee. All rights reserved.
//

#import "VSTimerLabel.h"

@interface VSTimerLabel() {
    NSString  *defaultText;
    
}
@end


@implementation VSTimerLabel


-(void)didMoveToSuperview {
    [self setTimeFormat:@"mm:ss"];
    [self setTimerType:MZTimerLabelTypeTimer];
    self.delegate = self;
}

-(void) setDefaultText:(NSString *)text {
    defaultText = text;
    self.text = text;
}

-(void)start {
    self.userInteractionEnabled = NO;
    [self reset];
    [super start];
}


#pragma mark - MZTimerLabelDelegate

-(void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime {
    self.userInteractionEnabled = YES;
    self.text = defaultText;
}

//-(void)timerLabel:(MZTimerLabel*)timerLabel countingTo:(NSTimeInterval)time timertype:(MZTimerLabelType)timerType {
//    
//}
//-(NSString*)timerLabel:(MZTimerLabel*)timerLabel customTextToDisplayAtTime:(NSTimeInterval)time {
//    
//}
@end

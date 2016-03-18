//
//  VibrationPlayer.m
//  VibroPhone
//
//  Created by Juho Pispa on 12.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

#import "VibrationPlayer.h"

void AudioServicesPlaySystemSoundWithVibration(int, id, id);

@implementation VibrationPlayer

- (void) playVibration:(NSArray *) times : (NSArray *) durations {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < durations.count; i++){
        [arr addObject:[NSNumber numberWithBool:YES]];
        [arr addObject:[durations objectAtIndex:i]];
        if(i < (times.count)) {
            [arr addObject:[NSNumber numberWithBool:NO]];
            [arr addObject:[times objectAtIndex:i]];
        }
    }
    [dict setObject:arr forKey:@"VibePattern"];
    [dict setObject:[NSNumber numberWithInt:1] forKey:@"Intensity"];
    
    AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
}

@end

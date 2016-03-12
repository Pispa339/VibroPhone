//
//  VibrationPlayer.h
//  VibroPhone
//
//  Created by Juho Pispa on 12.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VibrationPlayer : NSObject

- (void) playVibration:(NSArray *) times : (NSArray *) durations;

@end

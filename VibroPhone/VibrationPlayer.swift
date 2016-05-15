//
//  VibrationPlayer.swift
//  VibroPhone
//
//  Created by Juho Pispa on 15.5.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import Foundation

var vibrationPlayer:VibrationPlayer = VibrationPlayer()

func playVibrationMessage(key: String, messages: [String:[String:Float]]) {
    let messageDict = messages[key]
    let keys = Array(messageDict!.keys)
    var messageDateDict = [NSDate:Float]()
    var times = [Int]()
    var durations = [Int]()
    
    for key in keys {
        let date = dateFromString(key)
        messageDateDict[date] = messageDict![key]
    }
    
    var dates = Array(messageDateDict.keys)
    dates.sortInPlace({ $0.compare($1) == NSComparisonResult.OrderedAscending })
    
    for date in dates {
        let duration = (messageDateDict[date]! * 1000)
        durations.append(Int(duration))
    }
    
    for var i = 1; i < dates.count; i++ {
        let time = (dates[i].timeIntervalSinceDate(dates[i-1]) * 1000)
        times.append(Int(time))
    }
    
    for var i = 1; i < times.count; i++ {
        times[i] = times[i] - durations[i-1]
    }
    
    vibrationPlayer.playVibration(times, durations)
}

func dateFromString(dateString: String) -> NSDate {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = Constants.dateFormat
    let date = dateFormatter.dateFromString(dateString)
    return date!
}
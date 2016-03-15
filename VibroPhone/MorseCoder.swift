//
//  MorseAlphabets.swift
//  VibroPhone
//
//  Created by Juho Pispa on 13.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import Foundation

var pause:Double = 0.6
var charGap:Double = 1.0
var date = NSDate()
var charAsMorse = [String:Float]()

func stringToMorse(string: String) -> [String:Float] {
    date = NSDate()
    charAsMorse = [String:Float]()
    let characters = Array(string.characters)
    
    for character in characters {
        letterToMorse(character)
        date = date.dateByAddingTimeInterval(charGap)
    }
    return charAsMorse
}

func letterToMorse(char: Character){
    switch char {
    case "A":
        //add letter
        charAsMorse = addShort(charAsMorse)
        //add pause
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "B":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "C":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "D":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "E":
        charAsMorse = addShort(charAsMorse)
        break
    case "F":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "G":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "H":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "I":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "J":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "K":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "L":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "M":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "N":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "O":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "P":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "Q":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "R":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "S":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "T":
        charAsMorse = addLong(charAsMorse)
        break
    case "U":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "V":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "W":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "X":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "Y":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "Z":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "Å":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "Ä":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break
    case "Ö":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break
    case "0":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break

    case "1":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break

    case "2":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break

    case "3":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break

    case "4":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        break

    case "5":
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break

    case "6":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break

    case "7":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break

    case "8":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break

    case "9":
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addLong(charAsMorse)
        date = date.dateByAddingTimeInterval(pause)
        charAsMorse = addShort(charAsMorse)
        break

    default:
        break
    }
}

func addShort(var dict: [String:Float]) -> [String:Float] {
    let dateAsString = dateToString(date)
    dict[dateAsString] = 0.3
    date = date.dateByAddingTimeInterval(0.3)
    
    return dict
}

func addLong(var dict: [String:Float]) -> [String:Float] {
    let dateAsString = dateToString(date)
    dict[dateAsString] = 0.7
    date = date.dateByAddingTimeInterval(0.7)
    
    return dict
}

func dateToString(date: NSDate) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = Constants.dateFormat
    return dateFormatter.stringFromDate(date)
}




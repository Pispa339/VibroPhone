//
//  MorseAlphabets.swift
//  VibroPhone
//
//  Created by Juho Pispa on 13.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import Foundation

var pause:Double = 0.3
var charGap:Double = 0.6
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
        addShort()
        //add pause
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "B":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "C":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "D":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "E":
        addShort()
        break
    case "F":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "G":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "H":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "I":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "J":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "K":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "L":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "M":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "N":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "O":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "P":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "Q":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "R":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "S":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "T":
        addLong()
        break
    case "U":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "V":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "W":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "X":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "Y":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "Z":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "Å":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "Ä":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break
    case "Ö":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break
    case "0":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break

    case "1":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break

    case "2":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break

    case "3":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break

    case "4":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        break

    case "5":
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break

    case "6":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break

    case "7":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break

    case "8":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break

    case "9":
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addLong()
        date = date.dateByAddingTimeInterval(pause)
        addShort()
        break

    default:
        break
    }
}

func addShort() {
    let dateAsString = dateToString(date)
    charAsMorse[dateAsString] = 0.3
    date = date.dateByAddingTimeInterval(0.3)
}

func addLong(){
    let dateAsString = dateToString(date)
    charAsMorse[dateAsString] = 0.6
    date = date.dateByAddingTimeInterval(0.6)
}

func dateToString(date: NSDate) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = Constants.dateFormat
    return dateFormatter.stringFromDate(date)
}




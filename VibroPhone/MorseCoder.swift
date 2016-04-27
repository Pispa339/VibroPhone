//
//  MorseAlphabets.swift
//  VibroPhone
//
//  Created by Juho Pispa on 13.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import Foundation

var pause:Double = 0.5
var charGap:Double = 0.7
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
        addLong()
        break
    case "B":
        addLong()
        addShort()
        addShort()
        addShort()
        break
    case "C":
        addLong()
        addShort()
        addLong()
        addShort()
        break
    case "D":
        addLong()
        addShort()
        addShort()
        break
    case "E":
        addShort()
        break
    case "F":
        addShort()
        addShort()
        addLong()
        addShort()
        break
    case "G":
        addLong()
        addLong()
        addShort()
        break
    case "H":
        addShort()
        addShort()
        addShort()
        addShort()
        break
    case "I":
        addShort()
        addShort()
        break
    case "J":
        addShort()
        addLong()
        addLong()
        addLong()
        break
    case "K":
        addLong()
        addShort()
        addLong()
        break
    case "L":
        addShort()
        addLong()
        addShort()
        addShort()
        break
    case "M":
        addLong()
        addLong()
        break
    case "N":
        addLong()
        addShort()
        break
    case "O":
        addLong()
        addLong()
        addLong()
        break
    case "P":
        addShort()
        addLong()
        addLong()
        addShort()
        break
    case "Q":
        addLong()
        addLong()
        addShort()
        addLong()
        break
    case "R":
        addShort()
        addLong()
        addShort()
        break
    case "S":
        addShort()
        addShort()
        addShort()
        break
    case "T":
        addLong()
        break
    case "U":
        addShort()
        addShort()
        addLong()
        break
    case "V":
        addShort()
        addShort()
        addShort()
        addLong()
        break
    case "W":
        addShort()
        addLong()
        addLong()
        break
    case "X":
        addLong()
        addShort()
        addShort()
        addLong()
        break
    case "Y":
        addLong()
        addShort()
        addLong()
        addLong()
        break
    case "Z":
        addLong()
        addLong()
        addShort()
        addShort()
        break
    case "Å":
        addShort()
        addLong()
        addLong()
        addShort()
        addLong()
        break
    case "Ä":
        addShort()
        addLong()
        addShort()
        addLong()
        break
    case "Ö":
        addLong()
        addLong()
        addLong()
        addShort()
        break
    case "0":
        addLong()
        addLong()
        addLong()
        addLong()
        addLong()
        break

    case "1":
        addShort()
        addLong()
        addLong()
        addLong()
        addLong()
        break

    case "2":
        addShort()
        addShort()
        addLong()
        addLong()
        addLong()
        break

    case "3":
        addShort()
        addShort()
        addShort()
        addLong()
        addLong()
        break

    case "4":
        addShort()
        addShort()
        addShort()
        addShort()
        addLong()
        break

    case "5":
        addShort()
        addShort()
        addShort()
        addShort()
        addShort()
        break

    case "6":
        addLong()
        addShort()
        addShort()
        addShort()
        addShort()
        break

    case "7":
        addLong()
        addLong()
        addShort()
        addShort()
        addShort()
        break

    case "8":
        addLong()
        addLong()
        addLong()
        addShort()
        addShort()
        break

    case "9":
        addLong()
        addLong()
        addLong()
        addLong()
        addShort()
        break

    default:
        break
    }
}

func addShort() {
    let dateAsString = dateToString(date)
    charAsMorse[dateAsString] = 0.4
    date = date.dateByAddingTimeInterval(0.4 + pause)
}

func addLong(){
    let dateAsString = dateToString(date)
    charAsMorse[dateAsString] = 0.7
    date = date.dateByAddingTimeInterval(0.7 + pause)
}

func dateToString(date: NSDate) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = Constants.dateFormat
    return dateFormatter.stringFromDate(date)
}




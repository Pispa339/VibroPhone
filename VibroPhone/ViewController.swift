//
//  ViewController.swift
//  PongController
//
//  Created by Juho Pispa on 8.10.2015.
//  Copyright (c) 2015 Juho Pispa. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    let motionManager = CMMotionManager()
    var lPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
    var timestamps = [String: Float]()
    var startTime:NSDate = NSDate()
    var startTimeString:String = ""
    var ref = Firebase(url: "https://vibrophone.firebaseio.com/Users/Juho/messages")
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var touchPanel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().idleTimerDisabled = true
        initGestureRecognizers()
        
        messageTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
    }
    
    func initGestureRecognizers() {
        lPressGesture = UILongPressGestureRecognizer(target: self, action: "handleTouch:")
        lPressGesture.minimumPressDuration = 0
        touchPanel.addGestureRecognizer(lPressGesture)
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBOutlet weak var messageTextField: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTouch(recognizer: UILongPressGestureRecognizer!) {
        if(recognizer.state == UIGestureRecognizerState.Began) {
            touchPanel.backgroundColor = UIColor.darkGrayColor()
            startTimeString = currDateToString()
        }
        if(recognizer.state == UIGestureRecognizerState.Ended) {
            let elapsedTime = NSDate().timeIntervalSinceDate(startTime)
            let elapsedTimeFl = Float(elapsedTime)
            timestamps[startTimeString] = elapsedTimeFl
            startTime = NSDate()
            startTimeString = ""
            sendButton.enabled = true
            cancelButton.enabled = true
            print("touch saved")
            touchPanel.backgroundColor = UIColor.lightGrayColor()
        }
        messageTextField.enabled = false
    }
    
    func textFieldDidChange(textField: UITextField) {
        if(textField.text == "") {
            lPressGesture.enabled = true
            sendButton.enabled = false
            cancelButton.enabled = false
        }
        else {
            lPressGesture.enabled = false
            sendButton.enabled = true
            cancelButton.enabled = true
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func dictToJSON(dict:[String:Float]) -> String {
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            let jsonString = String(data: jsonData, encoding: NSUTF8StringEncoding)
            return jsonString!
        } catch let error as NSError {
            print(error)
        }
        return ""
    }
    
    func currDateToString() -> String {
            startTime = NSDate()
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = Constants.dateFormat
            return dateFormatter.stringFromDate(startTime)
    }
    
    @IBAction func sendButtonPressed(sender: AnyObject) {
        if(messageTextField.text == "") {
            sendMorseCode(timestamps)
        }
        else {
            let morseDict = stringToMorse(messageTextField.text!.uppercaseString)
            sendMorseCode(morseDict)
            messageTextField.text = ""
        }
        sendButton.enabled = false
        cancelButton.enabled = false
        messageTextField.enabled = true
        lPressGesture.enabled = true
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
    
    func sendMorseCode(dictToSend: [String:Float]) {
        let jsonString = dictToJSON(dictToSend)
        print(jsonString)
        let id = currDateToString()
        let msgPath = ref.childByAppendingPath(id)
        msgPath.setValue(dictToSend)
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        timestamps.removeAll()
        startTime = NSDate()
        startTimeString = ""
        sendButton.enabled = false
        cancelButton.enabled = false
        messageTextField.text = ""
        messageTextField.enabled = true
        lPressGesture.enabled = true
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


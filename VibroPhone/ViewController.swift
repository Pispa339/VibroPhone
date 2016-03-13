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
        
        let lPressGesture = UILongPressGestureRecognizer(target: self, action: "handleTouch:")
        lPressGesture.minimumPressDuration = 0
        touchPanel.addGestureRecognizer(lPressGesture)
        
    }
    
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
    }
    
    func dictToJSON(dict:Dictionary<String, Float>) -> String {
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
            dateFormatter.dateFormat = "SSS:ss:mm:HH_dd-MM-yyyy"
            return dateFormatter.stringFromDate(startTime)
    }
    
    @IBAction func sendButtonPressed(sender: AnyObject) {
        let jsonStringToSend = dictToJSON(timestamps)
        print(jsonStringToSend)
        let id = currDateToString()
        let msgPath = ref.childByAppendingPath(id)
        msgPath.setValue(timestamps)
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        timestamps.removeAll()
        startTime = NSDate()
        startTimeString = ""
        sendButton.enabled = false
        cancelButton.enabled = false
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


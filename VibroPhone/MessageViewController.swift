//
//  MessageViewController.swift
//  VibroPhone
//
//  Created by Juho Pispa on 11.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import UIKit
import CoreMotion

class MessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var messageTableView: UITableView!
    var messageTitles = [String]()
    var messages = [String:[String:Float]]()
    var ref = Firebase(url: "https://vibrophone.firebaseio.com/Users/Juho/messages")
    var vibrationPlayer:VibrationPlayer = VibrationPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        ref.queryOrderedByKey().observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            self.messages = snapshot.value as! [String:[String:Float]]
            self.messageTitles = Array(self.messages.keys)
            self.messageTitles.sortInPlace({ $0.compare($1) == NSComparisonResult.OrderedDescending })
            self.messageTableView.reloadData()
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = messageTitles[row]
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(messageTitles[row])
        playVibrationMessage(messageTitles[row])
    }
    
    func playVibrationMessage(key: String) {
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
    
    func JSONToDict(jsonString:String) -> Dictionary<String, Float> {
        do {
            let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)
            let decoded = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: []) as? [String:Float]
            // here "decoded" is the dictionary decoded from JSON data
            return decoded!
        } catch let error as NSError {
            print(error)
        }
        return ["": 0]
    }
}
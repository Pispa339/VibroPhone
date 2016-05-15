//
//  MsgsFromUserViewController.swift
//  VibroPhone
//
//  Created by Juho Pispa on 15.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import UIKit

class MsgsFromUserViewController: UITableViewController {

    var messageTitles = [String]()
    var messages = [String:[String:Float]]()
    var ref:Firebase!
    var senderUsername:String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        getMessages()
    }
    
    func getMessages() {
        ref = ref.childByAppendingPath(senderUsername)
        ref!.queryOrderedByKey().observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            self.messages = snapshot.value as! [String:[String:Float]]
            self.messageTitles = Array(self.messages.keys)
            self.messageTitles.sortInPlace({ $0.compare($1) == NSComparisonResult.OrderedDescending })
            self.tableView.reloadData()
            }, withCancelBlock: { error in
                print(error.description)
        })
    }

    // MARK:  UITextFieldDelegate Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageTitles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = messageTitles[row]
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        playVibrationMessage(messageTitles[row], messages: messages)
    }

}

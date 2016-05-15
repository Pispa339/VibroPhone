//
//  MessageTableViewController.swift
//  VibroPhone
//
//  Created by Juho Pispa on 15.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import UIKit

class MessageTableViewController: UITableViewController {
    
    @IBOutlet weak var composeButton: UIButton!
    var received = [String]()
    var ref = Firebase(url: "https://vibrophone.firebaseio.com/")
    var refForUser = Firebase(url: "https://vibrophone.firebaseio.com/Users")
    var loggedIn:Bool = false
    var uid:String = ""
    var username:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let defaults = NSUserDefaults.standardUserDefaults()
        //defaults.removeObjectForKey(Constants.userNameKey)
        //defaults.removeObjectForKey(Constants.passwordKey)
        let navbarColor:UIColor = UIColor(red: 199/255, green: 79/255, blue: 19/255, alpha: 1)
        navigationController!.navigationBar.barTintColor = navbarColor
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(!loggedIn) {
            authenticateUser()
        }
        else {
            getReceived()
        }
    }
    
    func getReceived() {
        refForUser.queryOrderedByKey().observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            let userData = snapshot.value
            if let _ = userData as? [String:[String:[String:Float]]] {
                let allData = userData as! [String:[String:[String:Float]]]
                let defaults = NSUserDefaults.standardUserDefaults()
                let oldData = defaults.dictionaryForKey("oldData")
                self.received = Array(allData.keys)
                if(oldData != nil) {
                    
                    let oldDataDict:[String:[String:[String:Float]]] = oldData as! [String:[String:[String:Float]]]
                    let oldReceived = Array(oldDataDict.keys)
                    
                    for receiver in self.received {
                        let messages: [String:[String:Float]] = allData[receiver]!
                        let messageTitles: [String] = Array(allData[receiver]!.keys)
                        if !oldReceived.contains(receiver) {
                            for message in messageTitles {
                                playVibrationMessage(message, messages: messages)
                            }
                        }
                        else {
                            let oldMessages: [String] = Array(oldDataDict[receiver]!.keys)
                            for message in messageTitles {
                                if !oldMessages.contains(message) {
                                    playVibrationMessage(message, messages: messages)
                                }
                            }

                        }
                    }
 
                    defaults.setObject(allData, forKey: "oldData")
                }
                else {
                    defaults.setObject(allData, forKey: "oldData")
                }
                self.received.sortInPlace({ $0.compare($1) == NSComparisonResult.OrderedDescending })
                self.tableView.reloadData()
            }
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
    
    func authenticateUser() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let usersUID = defaults.stringForKey(Constants.uidKey) {
            uid = usersUID
            loggedIn = true
            composeButton.enabled = true
            username = defaults.stringForKey(Constants.userNameKey)!
            let password = defaults.stringForKey(Constants.passwordKey)
            loginAndRetrieveData(username, password: password!)
        }
        else {
            loggedIn = false
            //composeButton.enabled = false
            defaults.removeObjectForKey(Constants.userNameKey)
            defaults.removeObjectForKey(Constants.passwordKey)
            self.performSegueWithIdentifier("showLogin", sender: self)
            return
        }
    }
    
    func loginAndRetrieveData(userName: String, password :String) {
        ref.authUser(userName, password: password) {
            error, authData in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Could not login", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            else {
                self.ref.observeAuthEventWithBlock({ authData in
                    if authData != nil {
                        // user authenticated
                        print(authData)
                        let usernamePathComponent = self.username.stringByReplacingOccurrencesOfString(".", withString: "")
                        self.refForUser = self.refForUser.childByAppendingPath(usernamePathComponent)
                        self.getReceived()
                    }
                    else {
                        let alert = UIAlertController(title: "Error", message: "No user signed in", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:  UITextFieldDelegate Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return received.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("usersCell", forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = received[row]
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMessages" {
            if let destination = segue.destinationViewController as? MsgsFromUserViewController {
                if let userIndex = tableView.indexPathForSelectedRow?.row {
                    destination.senderUsername = received[userIndex]
                    destination.ref = refForUser
                }
            }
        }
    }
    
}

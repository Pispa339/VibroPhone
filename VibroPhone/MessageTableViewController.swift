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
    var loggedIn:Bool = false
    var uid:String = ""
    var username:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let defaults = NSUserDefaults.standardUserDefaults()
        //defaults.removeObjectForKey(Constants.userNameKey)
        //defaults.removeObjectForKey(Constants.passwordKey)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        authenticateUser()
        if(loggedIn) {
            getReceived()
        }
    }
    
    func getReceived() {
        let refForUser = ref.childByAppendingPath(username)
        refForUser.queryOrderedByKey().observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            let userData = snapshot.value
            self.received = userData as! [String]
            self.received.sortInPlace({ $0.compare($1) == NSComparisonResult.OrderedDescending })
            self.tableView.reloadData()
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
    
    func authenticateUser() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let usersUID = defaults.stringForKey(Constants.uidKey)
        {
            uid = usersUID
            loggedIn = true
            composeButton.enabled = true
            let userName = defaults.stringForKey(Constants.userNameKey)
            let password = defaults.stringForKey(Constants.passwordKey)
            loginAndRetrieveData(userName!, password: password!)
        }
        else {
            loggedIn = false
            composeButton.enabled = false
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
            } else {
                self.ref.observeAuthEventWithBlock({ authData in
                    if authData != nil {
                        // user authenticated
                        print(authData)
                    } else {
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
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = received[row]
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        //print(received[row])
    }
    
}

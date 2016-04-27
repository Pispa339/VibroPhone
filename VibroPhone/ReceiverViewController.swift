//
//  ReceiverViewController.swift
//  VibroPhone
//
//  Created by Juho Pispa on 18.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import UIKit

class ReceiverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var newReceiverTField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    let defaults = NSUserDefaults.standardUserDefaults()
    var receivers = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.arrayForKey(Constants.receiversKey) != nil {
            receivers = defaults.arrayForKey(Constants.receiversKey) as! [String]
        }
        
        tableview.delegate = self
        tableview.dataSource = self
        newReceiverTField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        //self.navigationController?.pushViewController(ViewController, animated: true)
        receivers.append(newReceiverTField.text!)
        defaults.setObject(receivers, forKey: Constants.receiversKey)
        
        performSegueWithIdentifier("sendMessage", sender: nil)
        return true
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivers.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Receivers"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("receiverCell", forIndexPath: indexPath) 
        
        cell.textLabel?.text = receivers[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sendMessage" {
            if let destination = segue.destinationViewController as? ViewController {
                if let userIndex = tableview.indexPathForSelectedRow?.row {
                    destination.receiver = receivers[userIndex]
                    //destination.ref = refForUser
                }
                    
                else {
                    destination.receiver = newReceiverTField.text
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

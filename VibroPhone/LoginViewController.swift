//
//  LoginViewController.swift
//  VibroPhone
//
//  Created by Juho Pispa on 15.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTField: UITextField!
    @IBOutlet weak var passwordTField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var ref = Firebase(url: "https://vibrophone.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        if let _ = defaults.stringForKey(Constants.uidKey) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    

    @IBAction func signInButtonPressed(sender: AnyObject) {
        let userName = usernameTField.text
        let password = passwordTField.text
        
        ref.authUser(userName, password: password) {
            error, authData in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Could not login", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                self.ref.observeAuthEventWithBlock({ authData in
                    if authData != nil {
                        let defaults = NSUserDefaults.standardUserDefaults()
                        defaults.setObject(userName, forKey: Constants.userNameKey)
                        defaults.setObject(password, forKey: Constants.passwordKey)
                        defaults.setObject(authData.uid, forKey: Constants.uidKey)
                        self.dismissViewControllerAnimated(true, completion: nil)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

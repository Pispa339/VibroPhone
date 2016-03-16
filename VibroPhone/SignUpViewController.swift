//
//  SignUpViewController.swift
//  VibroPhone
//
//  Created by Juho Pispa on 15.3.2016.
//  Copyright © 2016 Juho Pispa. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTField: UITextField!
    @IBOutlet weak var password1TField: UITextField!
    @IBOutlet weak var password2TField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var ref = Firebase(url: "https://vibrophone.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
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

    
    @IBAction func signupButtonPressed(sender: AnyObject) {
        let username = usernameTField.text
        let password = password1TField.text
        if username != "" {
            if password != "" {
                if password == password2TField.text {
                    ref.createUser(usernameTField.text, password: password1TField.text,
                        withValueCompletionBlock: { error, result in
                            if error != nil {
                                // There was an error creating the account
                            } else {
                                let uid = result["uid"] as? String
                                print("Successfully created user account with uid: \(uid)")
                                let defaults = NSUserDefaults.standardUserDefaults()
                                defaults.setObject(username, forKey: Constants.userNameKey)
                                defaults.setObject(password, forKey: Constants.passwordKey)
                                defaults.setObject(uid, forKey: Constants.uidKey)
                                self.dismissViewControllerAnimated(true, completion: nil)
                            }
                    })
                }
                else {
                    showAlertWithMessage("Please check that you re-entered the password correctly")
                }
                
            }
            else {
                showAlertWithMessage("Please enter password")
            }
        }
        else {
            showAlertWithMessage("Please enter username")
        }
    }
    
    func showAlertWithMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
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

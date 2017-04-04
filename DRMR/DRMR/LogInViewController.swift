//
//  LogInViewController.swift
//  DRMR
//
//  Created by Akbar Mirza on 3/15/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {
    
    // =========================================================================
    // Outlets
    // =========================================================================
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // =========================================================================
    // Properties
    // =========================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // =========================================================================
    // Actions
    // =========================================================================
    @IBAction func onSignUp(_ sender: UIButton) {
        
        // initialize a user object
        let newUser = PFUser()
        
        // get username
        if let username = usernameField.text {
            newUser.username = username
        }
        
        // get password
        if let password = passwordField.text {
            newUser.password = password
        }
        
        // register user to parse
        newUser.signUpInBackground { (isSignedUp: Bool, error: Error?) in
            
            // if sign up succeeded
            if isSignedUp {
                
                // print success to console
                print("SUCCESS: \(newUser.username!) registered!")
                
                // manually segue to home view
                self.performSegue(withIdentifier: "isLoggedIn", sender: nil)
                
            } else {
                
                // print error to console
                if let error = error {
                    print(error.localizedDescription)
                }
                
                
            }
        }
        
    }
    
    
    @IBAction func onLogIn(_ sender: UIButton) {
        
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user: PFUser?, error: Error?) in
            
            // if there is an error with the login
            if let error = error {
                
                // print an error message to the console
                print("ERROR: User Login Failed!")
                // print specific error
                print(error.localizedDescription)
                
            } else {
                
                // if our user is not nil
                if let user = user {
                    
                    // print success to console
                    print("SUCCESS: \(user.username!) Logged In Succesfully!")
                    
                    // manually segue to home view
                    self.performSegue(withIdentifier: "isLoggedIn", sender: nil)
                }
                
            }
        }
        
    }
    
    
    
    // =========================================================================
    // Other Methods
    // =========================================================================

}

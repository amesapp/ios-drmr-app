//
//  HomeViewController.swift
//  DRMR
//
//  Created by Akbar Mirza on 3/15/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {
    
    // =========================================================================
    // Outlets
    // =========================================================================
    
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
    @IBAction func onSignOut(_ sender: UIBarButtonItem) {
        
        let username = PFUser.current()?.username
        
        PFUser.logOutInBackground {
            (error: Error?) in
            
            // PFUser.current() will now be nil
            print("SUCCESS: \(username!) Logged Out Succesfully!")
            
            // dismiss the current view
            self.dismiss(animated: true, completion: {
                
                // any completion code
            })
        }
        
    }
    
    
    
    
    // =========================================================================
    // Other Methods
    // =========================================================================

}

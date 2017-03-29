//
//  HomeViewController.swift
//  DRMR
//
//  Created by Akbar Mirza on 3/15/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import Parse

// =============================================================================
// Protocols
// =============================================================================


// =============================================================================
// View Controller
// =============================================================================
class HomeViewController: UIViewController {
    
    // =========================================================================
    // Outlets
    // =========================================================================
    @IBOutlet weak var tableView: UITableView!
    
    // =========================================================================
    // Properties
    // =========================================================================
    var dreams = [Dream]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // set tableview delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        // Dream.loadUserDreams { (dreams: [PFObject]?, error: Error?) in
        //     // if there is no error
        //     if error == nil {
        //         // the find succeeded
        //         print("SUCCESS: Retreived \(dreams!.count) dreams.")
        //
        //         // do something with the dreams
        //         if let dreams = dreams {
        //             for dream in dreams {
        //                 print("DREAM: \(dream["content"])")
        //                 print("AUTHOR: \(dream["author"])")
        //             }
        //         }
        //     } else {
        //         // log the details of the failure
        //         print("ERROR: \(error?.localizedDescription)")
        //     }
        // }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // load dreams
        Dream.loadUserDreams { (dreams: [PFObject]?, error: Error?) in
            // if there is no error
            if error == nil {
                // the find succeeded
                print("SUCCESS: Retreived \(dreams!.count) dreams.")
                
                self.dreams = [Dream]()
                // do something with the dreams
                if let dreams = dreams {
                    for dream in dreams {
                        
                        let content = dream["content"]! as! String
                        print(1)
                        let title = dream["title"] as! String?
                        print(2)
                        let timestamp = dream.createdAt!
                        
                        let myDream = Dream(withContent: content,
                              title: title,
                              createdAt: timestamp)
                        
                        self.dreams.append(myDream)
                        
                        print("=====")
                        // if let timestampString = timestampString {
                        //     let formatter = DateFormatter()
                        //     formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
                        //     timestamp = formatter.date(from: timestampString)!
                        //     print("TIMESTAMP: \(timestamp)")
                        // }
                        print(timestamp)
                        if let title = title {
                            print("TITLE: \(title)")
                        }
                        print("DREAM: \(content)")
                        
                        // let toAdd = Dream.init(withContent: dream["content"] as! String,
                        //                    title: dream["title"] as! String?,
                        //                    createdAt: dream["createdAt"] as! Date)
                        // print(toAdd)
                        
                        // reload tableView
                        self.tableView.reloadData()
                    }
                    
                }
            } else {
                // log the details of the failure
                print("ERROR: \(error?.localizedDescription)")
            }
        }
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
            
            // TODO: fix so it dismisses view even when we started logging in
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

// =============================================================================
// Extensions
// =============================================================================

// -----------------------------------------------------------------------------
// Table View Delegate
// -----------------------------------------------------------------------------
extension HomeViewController: UITableViewDelegate {
    
}

// -----------------------------------------------------------------------------
// Table View Data Source
// -----------------------------------------------------------------------------
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dreams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamCell", for: indexPath) as! DreamCell
        
        let dream = dreams[indexPath.row]
        
        cell.titleLabel.text = dream.title
        cell.previewLabel.text = dream.content
        
        return cell
    }
    
}

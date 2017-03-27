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

// -----------------------------------------------------------------------------
// Dream Editor Delegate Protocol
// -----------------------------------------------------------------------------
protocol DreamEditorDelegate: class {
    
    func didCreateDream(dream: Dream)
    
}


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
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamCell", for: indexPath)
        
        let contentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        
        let dream = dreams[indexPath.row]
        
        contentLabel.text = dream.content
        
        return cell
    }
    
}

extension HomeViewController: DreamEditorDelegate {
    
    internal func didCreateDream(dream: Dream) {
        
        // add our newly created dream to dreams
        dreams.append(dream)
        
        // reload our tableView
        tableView.reloadData()
    }

    
}

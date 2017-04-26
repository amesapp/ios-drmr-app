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
//    var isData = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // set tableview delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 250

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
                        let timestamp = dream["dreamDate"] as! Date

                        let myDream = Dream(withContent: content,
                              title: title,
                              createdDate: timestamp)

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
                        self.tableView.reloadData()
                    }

                }
            } else {
                // log the details of the failure
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "viewDreamSegue"{

            print("=================DO WE GET HERE ==================")


            let vc = segue.destination as! ViewDreamViewController
            // GET THE CELL INDEX PATH
            if let cellIndex = tableView.indexPathForSelectedRow?.row{
                vc.dream = dreams[cellIndex]
            }
            else{
                print("There was no dream in the selected row")
            }


//            vc.title1 = titleLabel.text
//            vc.content1 = previewLabel.text
//


        }


    }


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

        cell.dayLabel.text = dream.weekday
        cell.dateLabel.text = dream.date
        cell.monthLabel.text = dream.month

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableViewAutomaticDimension

    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableViewAutomaticDimension

    }

}

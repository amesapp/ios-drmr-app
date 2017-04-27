//
//  ViewDreamViewController.swift
//  DRMR
//
//  Created by Enzo Ames on 3/29/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

class ViewDreamViewController: UIViewController {

    // =========================================================================
    // Outlets
    // =========================================================================
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    // =========================================================================
    // Properties
    // =========================================================================
    var dream: Dream?

    override func viewDidLoad() {
        super.viewDidLoad()

        setOutlets()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setOutlets(){

        self.titleLabel.text = dream?.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.dateLabel.text = dateFormatter.string(from: (dream?.createdAt)!)
        self.contentLabel.text = dream?.content

        print("T: \(titleLabel.text!)")
        print("D: \(dateLabel.text!)")
        print("C: \(contentLabel.text!)")
    }
    
    func updateFavoriteButton() {
        
    }

    // =========================================================================
    // ACTIONS
    // =========================================================================
    @IBAction func onFavorite(_ sender: UIBarButtonItem) {
        
        if let dream = dream {
            // if already favorited, unfavorite
            if dream.isFavorited {
                dream.isFavorited = false
                // update icon
                // updateIcon()
                sender.title = "Favorite"
            } else {
                // otherwise... favorite
                dream.isFavorited = true
                // update icon
                // updateIcon()
                sender.title = "Unfavorite"
            }
        }
        
    }

    @IBAction func onShare(_ sender: UIBarButtonItem) {
        
        // text to share
        if let dreamText = self.contentLabel.text {
            
            var toShare = [String]()
            
            // set up activity view controller
            if let dreamTitle = self.titleLabel.text {
                
                toShare = [dreamTitle, dreamText]
                
            } else {
                
                toShare = [dreamText]
                
            }

            // set up activity view controller
            let activityVC = UIActivityViewController(activityItems: toShare,
                                                      applicationActivities: nil)
            activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem

            // present view controller
            present(activityVC, animated: true)
        }

    }



}

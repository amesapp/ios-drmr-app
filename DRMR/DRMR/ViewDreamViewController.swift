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
    // Variables
    // =========================================================================

    var title1: String?
    var date1: String?
    var content1: String?
    
    
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
        print("T: \(title1)")
        print("D: \(date1)")
        print("C: \(content1)")
        
        self.titleLabel.text = title1
        self.dateLabel.text = date1
        self.contentLabel.text = content1
    }
    

}

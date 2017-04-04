//
//  DreamCell.swift
//  DRMR
//
//  Created by Akbar Mirza on 3/20/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

class DreamCell: UITableViewCell {

    // =========================================================================
    // Outlets
    // =========================================================================
    // Dream Labels
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    // Mini Calendar Labels
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    var fullDate: Date?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewDreamSegue"{
            print("=================DO WE GET HERE ==================")
            
            let vc = segue.destination as! ViewDreamViewController
            vc.title1 = titleLabel.text
            vc.content1 = previewLabel.text
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            vc.date1 = dateFormatter.string(from: fullDate!)
        }
        
    }
    
    
}

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
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

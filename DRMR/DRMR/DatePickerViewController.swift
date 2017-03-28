//
//  DatePickerViewController.swift
//  DRMR
//
//  Created by Enzo Ames on 3/27/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

protocol DateSentDelegate {
    func userDidEnterDate(data: Date)
}


class DatePickerViewController: UIViewController {
    
    // =========================================================================
    // Outlets
    // =========================================================================
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var dateSelected: UIDatePicker!
    
    // =========================================================================
    // variables
    // =========================================================================
    
    var delegate: DateSentDelegate?
    
    var tempDate: Date?
    
    // =========================================================================
    // viewDidLoad()
    // =========================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds =  true
    }
    
    
    // =========================================================================
    // ACTIONS
    // =========================================================================
    
    @IBAction func selectingFromPicker(_ sender: Any) {
        tempDate = dateSelected.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        print("\(dateFormatter.string(from: tempDate!))")
        
    }
    
    
    @IBAction func onTapDoneButton(_ sender: Any) {
        if delegate != nil {
            if tempDate != nil{
                let passingDate = tempDate
                delegate?.userDidEnterDate(data: passingDate!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
}












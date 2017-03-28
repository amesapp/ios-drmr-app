//
//  DatePickerViewController.swift
//  DRMR
//
//  Created by Enzo Ames on 3/27/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        popUpView.layer.cornerRadius = 10
        selectDatePicker.layer.cornerRadius = 10
        popUpView.layer.masksToBounds =  true
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func pickerValueChanged(_ sender: Any) {
//        let formatter =
//        
//        
//    }
    
    @IBAction func onTapDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

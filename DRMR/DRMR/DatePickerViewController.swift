//
//  DatePickerViewController.swift
//  DRMR
//
//  Created by Enzo Ames on 3/27/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

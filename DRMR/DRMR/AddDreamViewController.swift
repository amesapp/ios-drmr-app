//
//  AddDreamViewController.swift
//  DRMR
//
//  Created by Enzo Ames on 3/22/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit

class AddDreamViewController: UIViewController {

    // =========================================================================
    // Outlets
    // =========================================================================
    
    @IBOutlet weak var titleLabel: UITextField!
    
    @IBOutlet weak var bodyLabel: UITextView!
    
    @IBOutlet weak var dateButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabel.text = "NO TITLE"
        setDefaultDate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setDefaultDate(){
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateButton.setTitle("\(dateFormatter.string(from: now))", for: .normal)
        print("\(dateFormatter.string(from: now))")
    
    }
    
    @IBAction func onTapDateButton(_ sender: Any) {
        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

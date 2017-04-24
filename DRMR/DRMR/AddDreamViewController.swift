//
//  AddDreamViewController.swift
//  DRMR
//
//  Created by Enzo Ames on 3/22/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import Parse

class AddDreamViewController: UIViewController, DateSentDelegate {

    // =========================================================================
    // Outlets
    // =========================================================================
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var bodyLabel: UITextView!
    @IBOutlet weak var dateButton: UIButton!
    
    // =========================================================================
    // Properties
    // =========================================================================
    
    var dreamDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dreamDate == nil {
            setDefaultDate()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setDefaultDate(){
        
        if dreamDate == nil{
            dreamDate = Date()
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        dateButton.setTitle("\(dateFormatter.string(from: dreamDate!))", for: .normal)
        print("\(dateFormatter.string(from: dreamDate!))")
        
    }
    
    
    // =========================================================================
    // ACTIONS
    // =========================================================================

    
    @IBAction func onCancelButton(_ sender: UIBarButtonItem) {
        
        // if user presses on cancel button, ignore all information
        // dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func onSaveButton(_ sender: UIBarButtonItem) {
        
        print("DATE ON CLICK SAVE: \(dreamDate!)")
        
        
        // if the user presses on the save button, create a new dream object
        if let content = bodyLabel.text {
            let myDream = Dream(withContent: content, title: titleLabel.text, createdAt: dreamDate!)
            
            // save the dream to our dreams list
            // delegate?.didCreateDream(dream: myDream)
            
            print("DATE ON CLICK SAVE INSIDE CREATED AT: \(dreamDate!)")

            
            
            Dream.postUserDream(myDream, withCompletion: { (success: Bool, error: Error?) in
                
                if success {
                    print("SUCCESS: Dream was Posted!")
                } else {
                    print(error!.localizedDescription)
                }
                
            })
            
            // once dream is saved, dismiss the current view controller
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    // =========================================================================
    // DELEGATE
    // =========================================================================
    
    
    func userDidEnterDate(data: Date){
        self.dreamDate = data
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        dateButton.setTitle("\(dateFormatter.string(from: dreamDate!))", for: .normal)
        print("\(dateFormatter.string(from: dreamDate!))")
        
        print("Dream Date Changed!")
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("\(segue.identifier!)")
    
        let vc = segue.destination as! DatePickerViewController
        vc.delegate = self
        
    }


}





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
    
    @IBOutlet weak var dateLabel: UITextField!
    
    @IBOutlet weak var bodyLabel: UITextView!
    
    // =========================================================================
    // Properties
    // =========================================================================
    weak var delegate: DreamEditorDelegate?
    
    var dreamDate: Date?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // titleLabel.text = "NO TITLE"
        
        self.delegate = parent as? DreamEditorDelegate
        
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
        dreamDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = "\(dateFormatter.string(from: dreamDate!))"
        print("\(dateFormatter.string(from: dreamDate!))")
    }
    
    // =========================================================================
    // ACTIONS
    // =========================================================================
    
    @IBAction func onCancelButton(_ sender: UIBarButtonItem) {
        
        // if user presses on cancel button, ignore all information
        // dismiss(animated: true, completion: nil)
        
        self.navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onSaveButton(_ sender: UIBarButtonItem) {
        
        // if the user presses on the save button, create a new dream object
        if let content = bodyLabel.text {
            let myDream = Dream(withContent: content, title: titleLabel.text, createdAt: dreamDate!)
            
            // save the dream to our dreams list
            delegate?.didCreateDream(dream: myDream)
            
            // once dream is saved, dismiss the current view controller
            self.navigationController?.dismiss(animated: true, completion: nil)
            
        }
        
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

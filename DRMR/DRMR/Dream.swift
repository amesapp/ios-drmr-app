//
//  Dream.swift
//  DRMR
//
//  Created by Akbar Mirza on 3/20/17.
//  Copyright © 2017 Akbar Mirza. All rights reserved.
//

import UIKit
import Parse

class Dream: NSObject {
    
    // =========================================================================
    // Properties
    // =========================================================================
    // let id: Int
    // let userID: Int?
    let createdAt: Date
    var title: String
    var content: String
    
    // var preview: String
    var isFavorited: Bool = false
    
    //
    var month: String
    var weekday: String
    var date: String
    
    let months = [
        "JAN", "FEB", "MAR", "APR", "MAY",
        "JUN", "JUL", "AUG", "SEP", "OCT",
        "NOV", "DEC"
    ]
    
    let weekdays = [
        "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"
    ]
    
    // =========================================================================
    // Static Properties
    // =========================================================================
    // static var currentID: Int = 0
    
    // =========================================================================
    // Constructor
    // =========================================================================
    init(withContent content: String, title: String?, createdDate: Date) {
        
        // set the dream id
        // self.id = Dream.currentID
        // Dream.currentID += 1
        
        // set the dream's date
        self.createdAt = createdDate
        
        print ("DATE FROM CONSTRUCTOR: \(createdDate)")
        print ("DATE FROM CONSTRUCTOR: \(self.createdAt)")
        
        // set the title if there is one
        self.title = title ?? ""
        
        // set the dreamContent
        self.content = content
        
        // set the dreamPreview to be the first 140 chars of a dream
        // let index = content.index(content.startIndex, offsetBy: 140, limitedBy: content.endIndex)
        // self.preview = content.substring(to: index!)
        
        let calendar = Calendar(identifier: .gregorian)
        let month = calendar.component(.month, from: createdAt)
        let day = calendar.component(.day, from: createdAt)
        let weekday = calendar.component(.weekday, from: createdAt)
        
        self.month = self.months[month - 1]
        self.date = String(day)
        self.weekday = self.weekdays[weekday - 1]
        
        print("Month: \(self.month)")
        print("Date: \(day)")
        print("Weekday: \(self.weekday)")
        
    }
    
    
    // =========================================================================
    // Other Methods
    // =========================================================================
    
    /**
     Method to add a user dream to Parse (uploading a dream)
     
     - parameter dream: Dream that the user wants to upload to parse
     - parameter completion: Block to be executed after save operation is complete
     */
    class func postUserDream(_ dream: Dream, withCompletion completion: PFBooleanResultBlock?) {
        
        // create Parse object PFObject
        let parseDream = PFObject(className: "Dream")
        
        // add relevant fields to the object
        // parseDream["id"] = dream.id
        
        
        
        
        // NOTE ! PARSE IS THE PROBLEM! CHANGE THE NAME 'CREATEDAT' ON PARSE OR SAVE IT AS A STRING
        
        
        
        print ("\n\nDATE FROM postUserDream\(dream.createdAt)\n\n")
        parseDream["dreamDate"] = dream.createdAt
        parseDream["title"] = dream.title
        parseDream["content"] = dream.content
        // parseDream["preview"] = dream.preview
        parseDream["isFavorited"] = dream.isFavorited
        parseDream["author"] = PFUser.current()
        
        // save object (following function will save the object in Parse asynchronously)
        parseDream.saveInBackground(block: completion)
    }
    
    class func loadUserDreams(withCompletion completion: @escaping ([PFObject]?, Error?) -> Void) {
        
        // construct query
        let dreamQuery = PFQuery(className: "Dream")
        // filter by the user
        if let user = PFUser.current() {
            // filter dreams by user name
            dreamQuery.whereKey("author", equalTo: user)
            
            // find objects in background
            dreamQuery.findObjectsInBackground(block: completion)
        }
        
    }
}

extension Date {
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    
}

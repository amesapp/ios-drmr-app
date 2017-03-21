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
    let id: Int
    // let userID: Int?
    let createdAt: Date
    var title: String
    var content: String
    var preview: String
    var isFavorited: Bool = false
    
    // =========================================================================
    // Static Properties
    // =========================================================================
    static var currentID: Int = 0
    
    // =========================================================================
    // Constructor
    // =========================================================================
    init(withContent content: String, title: String?) {
        
        // set the dream id
        self.id = Dream.currentID
        Dream.currentID += 1
        
        // set the dream's date
        self.createdAt = Date()
        
        // set the title if there is one
        self.title = title ?? ""
        
        // set the dreamContent
        self.content = content
        
        // set the dreamPreview to be the first 140 chars of a dream
        let index = content.index(content.startIndex, offsetBy: 140, limitedBy: content.endIndex)
        self.preview = content.substring(to: index!)
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
        parseDream["id"] = dream.id
        parseDream["createdAt"] = dream.createdAt
        parseDream["title"] = dream.title
        parseDream["content"] = dream.content
        parseDream["preview"] = dream.preview
        parseDream["isFavorited"] = dream.isFavorited
        
        // save object (following function will save the object in Parse asynchronously)
        parseDream.saveInBackground(block: completion)
    }
}

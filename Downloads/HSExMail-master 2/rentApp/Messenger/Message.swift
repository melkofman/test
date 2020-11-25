//
//  Message.swift
//  chatt
//
//  Created by Melanie Kofman on 05.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class Message: NSObject {
    var text: String?
    var from: String?
    
    
    init(text: String){
        self.text = text
    }
    init(text: String, from: String) {
        self.text = text
        self.from = from
    }
}

//
//  IceUrl.swift
//  SUSTcast
//
//  Created by Abrar on 8/14/21.
//

import Foundation

class IceUrl{
    
    var limit: Int?
    var numlisteners: Int?
    var url: String?
    
    
    
    init( limit: Int?,numlisteners: Int?,url: String? ){
        
        self.limit = limit
        self.numlisteners = numlisteners
        self.url = url
        
    }
    
}

//
//  Album.swift
//  Midterm
//
//  Created by user181154 on 11/19/20.
//

import Foundation

struct Album: Codable {
    var name: String
    var type: String
    var imageName: String
    var releaseDate: String
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.type = dictionary["type"] as? String ?? ""
        self.imageName = dictionary["imageName"] as? String ?? ""
        self.releaseDate = dictionary["releaseDate"] as? String ?? ""
    }
}

//
//  AlbumsDictionaries.swift
//  midterm
//
//  Created by Sam Meech-Ward on 2020-10-21.
//

import UIKit

class DataManager {
    
    private var albumDictionaries: [[String: String]] {
        let path = Bundle.main.path(forResource: "albums", ofType: "json")!
        let fileUrl = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: fileUrl, options: .mappedIfSafe)
        let json = try! JSONSerialization.jsonObject(with: data) as! [[String: String]]
        return json
    }
    
    func getAlbums() -> [Album] {
        var albums : [Album] = []
        for ad in albumDictionaries {
            albums.append(Album(dictionary: ad))
        }
        return albums
    }
}

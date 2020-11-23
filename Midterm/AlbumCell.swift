//
//  AlbumCell.swift
//  midterm
//
//  Created by user181154 on 11/20/20.
//

import UIKit

class AlbumCell : UICollectionViewCell {
    @IBOutlet var albumImage: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    
    var album : Album! {
        didSet {
            self.setUpCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCell () {
        self.albumImage.image = UIImage(named: album.imageName)
        self.detailLabel.text = album.name
    }
}

//
//  DetailViewController.swift
//  Midterm
//
//  Created by user181154 on 11/20/20
//

import UIKit

class DetailViewController : UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    var album: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setFront()
    }
    
    func setImage(image:UIImage) {
        self.imageView.image = image
    }
    
    func setFront() {
        self.navigationItem.title = album?.name
        self.imageView.image = UIImage(named: album?.imageName ?? "")
        self.nameLabel.text = album?.name ?? ""
        self.releaseDateLabel.text = album?.releaseDate ?? ""
    }
}


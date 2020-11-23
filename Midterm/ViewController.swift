//
//  ViewController.swift
//  Midterm
//
//  Created by Sam Meech-Ward on 2020-10-21.
//

import UIKit

class ViewController: UIViewController {
    
    var albums: [Album] = []
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let dataManager = DataManager()
        self.albums = dataManager.getAlbums()
        print(self.albums)
        
        self.collectionView.register(UINib(nibName: "AlbumCell", bundle: nil), forCellWithReuseIdentifier: "albumCell")
        self.collectionView.reloadData()
    }
    
    // for landscape layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if UIApplication.shared.statusBarOrientation.isLandscape {
            self.collectionView.collectionViewLayout = createCollectionViewLayoutLandScape()

        } else {
            self.collectionView.collectionViewLayout = createCollectionViewLayout()
        }
    }
    
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(400))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(400))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func createCollectionViewLayoutLandScape() -> UICollectionViewLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.85))
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.85))
        //let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [ item ])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        let section = NSCollectionLayoutSection(group: group)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        return UICollectionViewCompositionalLayout(section: section)
    }

}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: Collection view delegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! AlbumCell
        print (self.albums[indexPath.row])
        cell.album = self.albums[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let album = self.albums[indexPath.row]
        self.performSegue(withIdentifier: "homeToDetail", sender:album)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "homeToDetail":
            if let vc = segue.destination as? DetailViewController, let a = sender as? Album {
                vc.album = a
            }
            break
        default:
            break
        }
    }
}


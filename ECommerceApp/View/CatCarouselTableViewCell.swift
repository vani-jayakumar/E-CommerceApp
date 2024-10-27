//
//  CatCarouselTableViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

class CatCarouselTableViewCell: UITableViewCell {
    
    @IBOutlet weak var catCollectionView:UICollectionView!
    
    var catProducts: [Content] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "CatCollectionViewCell", bundle: nil)
        catCollectionView.register(nib, forCellWithReuseIdentifier: "CatCell")
        
        catCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension CatCarouselTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = catCollectionView.dequeueReusableCell(withReuseIdentifier: "CatCell", for: indexPath) as! CatCollectionViewCell
        cell.product = catProducts[indexPath.item]
        return cell
    }
}

extension CatCarouselTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 110)
    }
}

//
//  MPCarouselTableViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

class MPCarouselTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mpCollectionView: UICollectionView!
    
    var products : [Content] = []

    override func awakeFromNib() {
        super.awakeFromNib()
    
        let nib = UINib(nibName: "PdtCollectionViewCell", bundle: nil)
        mpCollectionView.register(nib, forCellWithReuseIdentifier: "PdtCell")
        
        mpCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension MPCarouselTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mpCollectionView.dequeueReusableCell(withReuseIdentifier: "PdtCell", for: indexPath) as! PdtCollectionViewCell
        
        cell.product = products[indexPath.item]
        
        return cell
    }
}

extension MPCarouselTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 150)
    }
}

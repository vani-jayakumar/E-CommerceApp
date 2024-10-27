//
//  BSCarouselTableViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

class BSCarouselTableViewCell: UITableViewCell {

    @IBOutlet weak var bsCollectionView: UICollectionView!
    
    var products: [Content] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib = UINib(nibName: "PdtCollectionViewCell", bundle: nil)
        bsCollectionView.register(nib, forCellWithReuseIdentifier: "PdtCell")
        
        bsCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BSCarouselTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bsCollectionView.dequeueReusableCell(withReuseIdentifier: "PdtCell", for: indexPath) as! PdtCollectionViewCell
    
        cell.product = products[indexPath.item]
                    
        return cell
    }
    
    
}

extension BSCarouselTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 150)
    }
}

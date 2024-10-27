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
        
        let product = products[indexPath.item]
                
                cell.pdtImage.loadImage(from: product.imageURL)
                cell.offerlabel.text = product.discount
                cell.namelabel.text = product.productName
                cell.ratinglabel.text = "\(product.productRating ?? 0) * "
                cell.pricelabel.text = product.offerPrice
                
        
        return cell
    }
    
    
}

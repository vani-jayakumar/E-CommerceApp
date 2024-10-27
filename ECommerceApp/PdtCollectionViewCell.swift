//
//  PdtCollectionViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

//
//star

class PdtCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pdtImage: UIImageView!
    @IBOutlet weak var offerlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var ratgStackView: UIStackView!
    
    
    var product: Content?  {
        didSet {
            setData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        setupCell()
        
    }
    
    private func setData() {
        
        guard let product = product else { return }
        pdtImage.loadImage(from: product.imageURL, defaultImage: UIImage(named: "Electronics"))       
        offerlabel.text = product.discount
        namelabel.text = product.productName
        pricelabel.text = product.offerPrice
        
        guard let rtg = product.productRating else {
            return
        }
        for i in 0..<rtg {
            let tag = i + 1000
            (ratgStackView.viewWithTag(tag) as? UIImageView)?.image = UIImage(systemName: "star.fill")
        }


    }
    
    private func setupCell() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        offerlabel.layer.cornerRadius = 6
        
    }

}

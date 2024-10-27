//
//  CatCollectionViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

class CatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pdtImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
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
        nameLabel.text = product.title
        if product.title == "Mobile" {
            pdtImage.loadImage(from: product.imageURL, defaultImage: UIImage(named: "Mobiles"))
        }
        if product.title == "Appliances" {
            pdtImage.loadImage(from: product.imageURL, defaultImage: UIImage(named: "Appliances"))
        }
        if product.title == "Smart TV" {
            pdtImage.loadImage(from: product.imageURL, defaultImage: UIImage(named: "SmartTV"))
        }
        if product.title == "Wearables" {
            pdtImage.loadImage(from: product.imageURL, defaultImage: UIImage(named: "Wearables"))
        }
        
    }
    private func setupCell() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

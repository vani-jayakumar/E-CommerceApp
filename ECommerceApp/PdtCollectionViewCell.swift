//
//  PdtCollectionViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

class PdtCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pdtImage: UIImageView!
    @IBOutlet weak var offerlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var ratinglabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

}

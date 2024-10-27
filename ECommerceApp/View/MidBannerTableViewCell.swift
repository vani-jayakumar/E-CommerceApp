//
//  MidBannerTableViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

class MidBannerTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var midBannerImage: UIImageView!
    
    var imageURl: String? {
        didSet {
            midBannerImage.loadImage(from: imageURl , defaultImage: UIImage(named: "MidBanner"))
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        midBannerImage.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    
}

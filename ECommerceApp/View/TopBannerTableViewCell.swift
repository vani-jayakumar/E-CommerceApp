//
//  TopBannerTableViewCell.swift
//  ECommerceApp
//
//  Created by Vani on 10/26/24.
//

import UIKit

class TopBannerTableViewCell: UITableViewCell {
   
    var images: [UIImage] = [] {
        didSet {
            currentImageIndex = 0
            currentImageView.image = images.first
            startSlidingAnimation()
        }
    }
    
    private var currentImageIndex = 0
    private var currentImageView: UIImageView!
    private var nextImageView: UIImageView!
    private var timer: Timer?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupImageViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       
        timer?.invalidate()
        currentImageView.frame = bounds
        nextImageView.frame = bounds.offsetBy(dx: bounds.width, dy: 0)
        currentImageIndex = 0
    }
    
    private func setupImageViews() {
        
        currentImageView = UIImageView()
        currentImageView.contentMode = .scaleAspectFill
        currentImageView.frame = bounds
        addSubview(currentImageView)
        
        nextImageView = UIImageView()
        nextImageView.contentMode = .scaleAspectFill
        nextImageView.frame = bounds.offsetBy(dx: bounds.width, dy: 0)
        addSubview(nextImageView)
        
        images =  [UIImage(named: "TopBanner1")!,
        UIImage(named: "TopBanner2")!,
        UIImage(named: "TopBanner3")!]
    }
    
    func startSlidingAnimation() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(performSlideTransition), userInfo: nil, repeats: true)
    }
    
    @objc private func performSlideTransition() {
        guard !images.isEmpty else { return }
        
        let nextIndex = (currentImageIndex + 1) % images.count
        nextImageView.image = images[nextIndex]
        
        let width = UIScreen.main.bounds.width
       
        UIView.animate(withDuration: 1.0, animations: {
            self.currentImageView.frame = self.bounds.offsetBy(dx: -width, dy: 0)
            self.nextImageView.frame = CGRect(x: 0, y: 0, width: width, height: 150)
        }, completion: { _ in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                
                self.currentImageView.image = self.nextImageView.image
                self.currentImageView.frame = CGRect(x: 0, y: 0, width: width, height: 150)
                self.nextImageView.frame = self.bounds.offsetBy(dx: width, dy: 0)
                
               
                self.currentImageIndex = nextIndex
            })
            
        })
    }
}

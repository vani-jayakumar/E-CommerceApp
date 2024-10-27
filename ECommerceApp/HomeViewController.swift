//
//  HomeViewController.swift
//  ECommerceApp
//
//  Created by Vani on 10/24/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.backgroundImage = UIImage()
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
               textField.backgroundColor = .white
        }
        let nib1 = UINib(nibName: "TopBannerTableViewCell", bundle: nil)
            tableView.register(nib1, forCellReuseIdentifier: "TopBannerCell")
        
        let nib2 = UINib(nibName: "MidBannerTableViewCell", bundle: nil)
            tableView.register(nib2, forCellReuseIdentifier: "MidBannerCell")
        
        let nib3 = UINib(nibName: "LabelTableViewCell", bundle: nil)
            tableView.register(nib3, forCellReuseIdentifier: "LabelCell")
        
        let nib4 = UINib(nibName: "BSCarouselTableViewCell", bundle: nil)
            tableView.register(nib4, forCellReuseIdentifier: "BSCarouselCell")
        
        let nib5 = UINib(nibName: "CatCarouselTableViewCell", bundle: nil)
            tableView.register(nib5, forCellReuseIdentifier: "CatCarouselCell")
        
        let nib6 = UINib(nibName: "MPCarouselTableViewCell", bundle: nil)
            tableView.register(nib6, forCellReuseIdentifier: "MPCarouselCell")
        
        
        
        fetchData()
    }
    
    func fetchData() {
            let model = ECmodel()
            model.fetchData { [weak self] sections in
                guard let self = self, let sections = sections else { return }
                self.sections = sections
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
}
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopBannerCell", for: indexPath) as! TopBannerTableViewCell
            if let contents = sections.first?.contents, !contents.isEmpty {
                   cell.topBannerImage.loadImage(from: contents[0].imageURL, defaultImage: UIImage(named: "TopBanner"))
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelTableViewCell
            if sections.count > 1 {
                cell.pdtLabel.text = sections[1].title
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BSCarouselCell", for: indexPath) as! BSCarouselTableViewCell
            if sections.count > 1 {
                cell.products = sections[1].contents ?? []
                cell.bsCollectionView.reloadData()
           }
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MidBannerCell", for: indexPath) as! MidBannerTableViewCell
            if sections.count > 2, let imageURL = sections[2].imageURL {
                cell.midBannerImage.loadImage(from: imageURL, defaultImage: UIImage(named: "MidBanner"))
            }
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelTableViewCell
            if sections.count > 3 {
                cell.pdtLabel.text = sections[3].title
            }
            return cell
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CatCarouselCell", for: indexPath) as! CatCarouselTableViewCell
            if sections.count > 3 {
                cell.catProducts = sections[3].contents ?? []
                cell.catCollectionView.reloadData()
            }
            return cell
            
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelTableViewCell
            if sections.count > 4 {
                cell.pdtLabel.text = sections[4].title
            }
            return cell
            
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MPCarouselCell", for: indexPath) as! MPCarouselTableViewCell
            if sections.count > 4 {
                cell.products = sections[4].contents ?? []
                cell.mpCollectionView.reloadData()
            }
            return cell
            
        default:
            fatalError("Unexpected indexPath")
            
        }
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 3:
            return 100
        
        case 1, 4, 6:
            return 30
            
        case 2, 7:
            return 200
            
        case 5:
            return 150
            
        default:
            return UITableView.automaticDimension
        }
    }
}

//
//  TabViewController.swift
//  ECommerceApp
//
//  Created by Vani on 10/25/24.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.systemGreen
        
        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let categoryController = CategoryViewController(nibName: "CategoryViewController", bundle: nil)
        categoryController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "square.grid.2x2"), tag: 1)
        
        let cartController = CartViewController(nibName: "CartViewController", bundle: nil)
        cartController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart.fill"), tag: 2)
        
        let offersController = OffersViewController(nibName: "OffersViewController", bundle: nil)
        offersController.tabBarItem = UITabBarItem(title: "Offers", image: UIImage(systemName: "percent.ar"), tag: 3)
        
        let accountController = AccountViewController(nibName: "AccountViewController", bundle: nil)
        accountController.tabBarItem = UITabBarItem(title: "Account", image: UIImage(systemName: "person.fill"), tag: 4)
        
        viewControllers = [homeController,categoryController,cartController,offersController, accountController]
    
    }
    


}

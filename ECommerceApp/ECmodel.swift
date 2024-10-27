//
//  ECmodel.swift
//  ECommerceApp
//
//  Created by Vani on 10/24/24.
//

import Foundation
import UIKit

struct Section: Codable {
    let type: SectionType
    let title: String
    let contents: [Content]?
    let imageURL: String?
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case type, title, contents
        case imageURL = "image_url"
        case id
    }
}

struct Content: Codable {
    let title: String?
    let imageURL: String?
    let sku: String?
    let productName: String?
    let productRating: Int?
    let actualPrice: String?
    let offerPrice: String?
    let discount: String?
    
    enum CodingKeys: String, CodingKey {
        case title, sku
        case imageURL = "image_url"
        case productName = "product_name"
        case productRating = "product_rating"
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case discount
    }
}

enum SectionType: String, Codable {
    case bannerSlider = "banner_slider"
    case products = "products"
    case bannerSingle = "banner_single"
    case categories = "catagories" 
    case type3 = "type 3"
    case type4 = "type 4"
    case type5 = "type 5"
    case type6 = "type 6"
}

class ECmodel {
    func fetchData(callBack: @escaping ([Section]?) -> Void) {
        let urlString = "https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo"
        
        guard let url = URL(string: urlString) else {
            callBack(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error in fetching data: \(error.localizedDescription)")
                callBack(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                callBack(nil)
                return
            }
            
            do {
                
                let sections = try JSONDecoder().decode([Section].self, from: data)
                    callBack(sections)
                
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                callBack(nil)
            }
        }.resume()
    }
}
extension UIImageView {
    func loadImage(from urlString: String?, defaultImage: UIImage? = UIImage(systemName: "photo")) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            self.image = defaultImage
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self, let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}


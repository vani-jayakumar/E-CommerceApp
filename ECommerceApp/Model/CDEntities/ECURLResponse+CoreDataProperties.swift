//
//  ECURLResponse+CoreDataProperties.swift
//  ECommerceApp
//
//  Created by Vani on 10/27/24.
//
//

import Foundation
import CoreData


extension ECURLResponse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ECURLResponse> {
        return NSFetchRequest<ECURLResponse>(entityName: "ECURLResponse")
    }

    @NSManaged public var data: Data?
    @NSManaged public var url: String?

}

extension ECURLResponse : Identifiable {

}

//
//  DBManager.swift
//  ECommerceApp
//
//  Created by Vani on 10/27/24.
//

import Foundation
import UIKit
import CoreData

final class DBManager {
    
    static let shared = DBManager()
    
    private init() {
        
    }
    
    func cacheResponse(for url: String, jsonData: Data) {
        let context = persistentContainer.viewContext

        
        let urlResponse = ECURLResponse(context: context)
        urlResponse.url = url
        urlResponse.data = jsonData

        do {
            try context.save()
            print("Successfully cached response for URL: \(url)")
        } catch {
            print("Failed to save response: \(error)")
        }
    }
    
    func fetchCachedResponse(for url: String) -> Data? {
        let context = persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<ECURLResponse> = ECURLResponse.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "url == %@", url)

        do {
            let results = try context.fetch(fetchRequest)
            if let cachedResponse = results.first {
                return cachedResponse.data
            }
        } catch {
            print("Failed to fetch cached response: \(error)")
        }
        return nil
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ECCoreDataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

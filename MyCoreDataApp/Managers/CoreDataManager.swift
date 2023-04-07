//
//  CoreDataManager.swift
//  MyCoreDataApp
//
//  Created by alexKoro on 6.04.23.
//

import Foundation
import CoreData
import SwiftyJSON

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MyCoreDataModel")
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        container.loadPersistentStores { _, error in
            if let error = error{
                fatalError("loadPersistenStores is fail.")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        get {
            return container.viewContext
        }
    }
    
    private init() { }
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("viewContext not save.\nError:\(error.localizedDescription)")
        }
    }
    
    func importUsers(from json: JSON) {
        for row in json.arrayValue {
            let user = User(context: viewContext)
            user.name = row["name"].stringValue
            user.email = row["email"].stringValue
            user.id = row["id"].int32Value
            user.username = row["username"].stringValue
        }
        saveContext()
    }
    
    func exportUsers(_ completion: (([User])->())? = nil) {
        let fetch = User.fetchRequest()
        do {
            let users = try  viewContext.fetch(fetch)
            completion?(users)
        } catch {
            print("loadUsers Error.")
        }
    }
    
}

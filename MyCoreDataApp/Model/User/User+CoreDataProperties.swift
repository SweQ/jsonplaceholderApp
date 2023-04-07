//
//  User+CoreDataProperties.swift
//  MyCoreDataApp
//
//  Created by alexKoro on 6.04.23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String
    @NSManaged public var id: Int32
    @NSManaged public var name: String
    @NSManaged public var username: String

}

extension User : Identifiable {

}

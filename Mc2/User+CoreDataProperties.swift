//
//  User+CoreDataProperties.swift
//  Mc2
//
//  Created by Ricky Adi Kuncoro on 26/06/18.
//  Copyright © 2018 est. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var name: String?

}

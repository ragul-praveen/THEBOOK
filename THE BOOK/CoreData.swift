//
//  CoreData.swift
//  THE BOOK
//
//  Created by Srikanth Vemana on 28/10/21.
//

import Foundation
import CoreData


extension Books {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Books> {
        return NSFetchRequest<Books>(entityName: "Books")
    }

    @NSManaged public var author: String?
    @NSManaged public var dfine: String?
    @NSManaged public var id: String?
    @NSManaged public var lfine: String?
    @NSManaged public var maincategory: String?
    @NSManaged public var name: String?
    @NSManaged public var on: String?
    @NSManaged public var returns: String?
    @NSManaged public var to: String?

}

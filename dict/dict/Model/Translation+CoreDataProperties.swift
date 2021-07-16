//
//  Translation+CoreDataProperties.swift
//  dict
//
//  Created by Ekaterina Tarasova on 30.06.2021.
//
//

import Foundation
import CoreData


extension Translation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Translation> {
        return NSFetchRequest<Translation>(entityName: "Translation")
    }

    @NSManaged public var translate: String?
    @NSManaged public var word: String?
    @NSManaged public var category: Category?

}

extension Translation : Identifiable {

}

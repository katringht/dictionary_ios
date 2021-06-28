//
//  Category+CoreDataProperties.swift
//  dict
//
//  Created by Ekaterina Tarasova on 28.06.2021.
//
//

import UIKit
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var color: UIColor?
    @NSManaged public var label: String?
    @NSManaged public var translation: NSSet?

}

// MARK: Generated accessors for translation
extension Category {

    @objc(addTranslationObject:)
    @NSManaged public func addToTranslation(_ value: Translation)

    @objc(removeTranslationObject:)
    @NSManaged public func removeFromTranslation(_ value: Translation)

    @objc(addTranslation:)
    @NSManaged public func addToTranslation(_ values: NSSet)

    @objc(removeTranslation:)
    @NSManaged public func removeFromTranslation(_ values: NSSet)

}

extension Category : Identifiable {

}

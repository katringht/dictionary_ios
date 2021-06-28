//
//  DataManager.swift
//  dict
//
//  Created by Ekaterina Tarasova on 28.06.2021.
//

import UIKit
import CoreData

class DataManager {
    // MARK: - Core Data stack
    
    static let shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "dict")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func category(title: String, color: UIColor) -> Category {
        let cat = Category(context: persistentContainer.viewContext)
        cat.label = title
        cat.color = color
        return cat
    }
    
//    func translate(word: String, translate: String, category: Category) -> Translation {
//        let transl = Translation(context: persistentContainer.viewContext)
//        transl.word = word
//        transl.translate = translate
//        transl.category = category
//        return transl
//    }
    
    //fetching data
    
    func fetchRequest() -> [Category] {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        var fetchedMyCategiries: [Category] = []
        
        do {
            fetchedMyCategiries = try persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching")
        }
        return fetchedMyCategiries
    }
    
    // MARK: - Core Data Saving support
    
    func save () {
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

@objc(UIColorValueTransformer)
final class ColorValueTransformer: NSSecureUnarchiveFromDataTransformer {

    // The name of the transformer. This is the name used to register the transformer using `ValueTransformer.setValueTrandformer(_"forName:)`.
    static let name = NSValueTransformerName(rawValue: String(describing: ColorValueTransformer.self))

    // 2. Make sure `UIColor` is in the allowed class list.
    override static var allowedTopLevelClasses: [AnyClass] {
        return [UIColor.self]
    }

    // Registers the transformer.
    public static func register() {
        let transformer = ColorValueTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
}

// просто для теста
var i: [Transl] = []

struct Transl {
    var word: String
    var translate: String
}

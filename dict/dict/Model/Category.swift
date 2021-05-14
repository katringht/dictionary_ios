//
//  Category.swift
//  dict
//
//  Created by Ekaterina Tarasova on 11.04.2021.
//

import UIKit

struct Category {
    var label: String
    var color: UIColor
}

var caterories: [Category] = [
    Category(label: "verb", color: (UIColor(named: "Pink"))!),
    Category(label: "nouns", color: (UIColor(named: "Yellow"))!),
    Category(label: "adj", color: (UIColor(named: "Blue"))!),
//    Category(label: "other", color: (UIColor(named: "Orange"))!),
//    Category(label: "moreeeee", color: (UIColor(named: "Yellow"))!),
]

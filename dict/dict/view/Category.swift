//
//  Category.swift
//  dict
//
//  Created by Ekaterina Tarasova on 11.04.2021.
//

import UIKit

struct Category {
    let label: String
    let color: UIColor
}

let caterories: [Category] = [
    Category(label: "verb", color: (UIColor(named: "Color1"))!),
    Category(label: "nouns", color: (UIColor(named: "Color2"))!),
    Category(label: "adj", color: (UIColor(named: "Color3"))!),
    Category(label: "other", color: (UIColor(named: "Color5"))!),
    Category(label: "moreeeee", color: (UIColor(named: "Color4"))!),
]

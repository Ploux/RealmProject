//
//  Item.swift
//  RealmProject
//
//  Created by Peter Loux on 6/24/24.
//

import Foundation
import RealmSwift

final class Item: Object, ObjectKeyIdentifiable {

    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name = "\(randomAdjectives.randomElement()!) \(randomNouns.randomElement()!)"
    @Persisted var isFavorite = false

    @Persisted(originProperty: "items") var group: LinkingObjects<Group>
}
    /// Random adjectives for more interesting demo item names
    let randomAdjectives = [
        "fluffy", "classy", "bumpy", "bizarre", "wiggly", "quick", "sudden",
        "acoustic", "smiling", "dispensable", "foreign", "shaky", "purple", "keen",
        "aberrant", "disastrous", "vague", "squealing", "ad hoc", "sweet"
    ]
    /// Random noun for more interesting demo item names
    let randomNouns = [
        "floor", "monitor", "hair tie", "puddle", "hair brush", "bread",
        "cinder block", "glass", "ring", "twister", "coasters", "fridge",
        "toe ring", "bracelet", "cabinet", "nail file", "plate", "lace",
        "cork", "mouse pad"
    ]

    

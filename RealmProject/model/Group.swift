//
//  Group.swift
//  RealmProject
//
//  Created by Peter Loux on 6/24/24.
//

import Foundation
import RealmSwift

final class Group: Object, ObjectKeyIdentifiable {

    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var items = RealmSwift.List<Item>()
    
    
    
}

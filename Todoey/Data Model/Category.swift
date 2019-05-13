//
//  Category.swift
//  Todoey
//
//  Created by Dariusz Urbanczyk on 26/04/2019.
//  Copyright © 2019 Dariusz Urbanczyk. All rights reserved.
//

import Foundation
import RealmSwift
class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

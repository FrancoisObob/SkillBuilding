//
//  Order.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/15/23.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published private(set) var items: [Appetizer] = []

    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }

    func remove(_ appetizer: Appetizer) {
        items = items.filter { $0.id != appetizer.id }
    }

    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
}


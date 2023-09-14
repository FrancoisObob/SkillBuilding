//
//  Item.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/14/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

enum ImageDimension {
    case square, banner
}


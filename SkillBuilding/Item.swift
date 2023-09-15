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
    var emojis = ["😣", "🤯", "🫠"]

    init(timestamp: Date) {
        self.timestamp = timestamp
    }

    func printEmojis() {
        emojis.filter { $0 != "🫠" }.forEach { print($0) }
    }
}

enum ImageDimension {
    case square, banner
}

struct Video {
    var title: String
    var date: Date

    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
}

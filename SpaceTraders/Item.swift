//
//  Item.swift
//  SpaceTraders
//
//  Created by Rylie Castell on 23.06.25.
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

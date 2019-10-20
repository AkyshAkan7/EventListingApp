//
//  Event.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/16/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import Foundation

struct Event: Codable {
    
    let name: String
    let description: String
    let place: String
    let date: String
    var isFavourite: Bool = false
    let category: Category
}

extension Event: Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return
            lhs.name == rhs.name &&
                lhs.description == rhs.description &&
                lhs.date == rhs.date &&
                lhs.place == rhs.place
        
    }
}

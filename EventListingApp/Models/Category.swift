//
//  Category.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/17/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import Foundation

struct Category: Codable {
    let name: String
}

extension Category: Equatable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return
            lhs.name == rhs.name
    }
}

enum CategoryType: String {
    case Entertainment
    case Sport
    case Exhibition
    case Music
    
    func value() -> String {
        return self.rawValue
    }
}

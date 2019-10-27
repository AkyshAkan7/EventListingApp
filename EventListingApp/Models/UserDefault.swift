//
//  UserDefaults.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/27/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import Foundation

class UserDefault {
    
    static func loadData(key: String) {
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            switch key {
            case "events":
                EventManager.instance.events = try! PropertyListDecoder().decode(Array<Event>.self, from: data)
            case "favouriteEvents":
                EventManager.instance.favouriteEvents = try! PropertyListDecoder().decode(Array<Event>.self, from: data)
            default:
                print("Error with loading data")
            }
        }
    }
    
    static func saveData(key: String) {
        switch key {
        case "events":
            UserDefaults.standard.set(try? PropertyListEncoder().encode(EventManager.instance.events), forKey: "events")
        case "favouriteEvents":
            UserDefaults.standard.set(try? PropertyListEncoder().encode(EventManager.instance.favouriteEvents), forKey: "favouriteEvents")
        default:
            print("Error with saving data")
        }
    }
    
}

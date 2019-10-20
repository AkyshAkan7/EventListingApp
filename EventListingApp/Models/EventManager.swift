//
//  EventManager.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/17/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import UIKit

class EventManager: NSObject {
    
    static let instance = EventManager()
    var events = [Event]()
    var favouriteEvents = [Event]()
}

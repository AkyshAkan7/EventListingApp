//
//  EventDetailsViewController.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/16/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
     
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventCategoryLabel: UILabel!
    @IBOutlet weak var eventPlaceLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var setFavouriteButton: UIButton!
    
    
    var cellValue: Event! = nil
    var cellIndex: Int = 0
    var isFavouriteEvent: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView(event: cellValue)

        if cellValue != nil {
            eventNameLabel.text = cellValue.name
            eventDateLabel.text = cellValue.date
            eventDescriptionLabel.text = cellValue.description
            eventCategoryLabel.text = cellValue.category.name
            eventPlaceLabel.text = cellValue.place
        }
        
    }
    
    @IBAction func setFavourite(_ sender: UIButton) {
        if EventManager.instance.events[cellIndex].isFavourite == true {
            setFavouriteButton.setTitle("Add to favourites", for: .normal)
            EventManager.instance.events[cellIndex].isFavourite = false
            
            if let itemToRemoveIndex = EventManager.instance.favouriteEvents.firstIndex(of: EventManager.instance.events[cellIndex]) {
                EventManager.instance.favouriteEvents.remove(at: itemToRemoveIndex)
            }
        } else {
            setFavouriteButton.setTitle("Remove from favourites", for: .normal)
            EventManager.instance.events[cellIndex].isFavourite = true
            
            EventManager.instance.favouriteEvents.append(EventManager.instance.events[cellIndex])
        }
        
        UserDefault.saveData(key: "events")
        UserDefault.saveData(key: "favouriteEvents")
    }
    
    
    func setupView(event: Event) {
        
        
        if isFavouriteEvent == true {
            setFavouriteButton.isHidden = true
        }
        
        ViewController.setupViewLayer(view: backgroundView, cornerRadius: 8, shadowOpacity: 1, shadowRadius: 10, shadowOffset: CGSize(width: 0, height: 0), shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor)
        
        ViewController.setupViewLayer(view: setFavouriteButton, cornerRadius: 7, shadowOpacity: 1, shadowRadius: 5, shadowOffset: CGSize(width: 0, height: 0), shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor)
        
        switch event.isFavourite {
        case true:
            setFavouriteButton.setTitle("Remove from favourites", for: .normal)
        case false:
            setFavouriteButton.setTitle("Add to favourites", for: .normal)
        }
        
        switch event.category.name {
        case CategoryType.Entertainment.value():
            backgroundView.backgroundColor = UIColor(named: "Pink")
        case CategoryType.Music.value():
            backgroundView.backgroundColor = UIColor(named: "Green")
        case CategoryType.Exhibition.value():
            backgroundView.backgroundColor = UIColor(named: "Blue")
        case CategoryType.Sport.value():
            backgroundView.backgroundColor = UIColor(named: "Purple")
        default:
            backgroundView.backgroundColor = .gray
        }
    }

}

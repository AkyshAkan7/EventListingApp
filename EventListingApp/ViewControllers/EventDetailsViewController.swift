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
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(EventManager.instance.events), forKey: "events")
        UserDefaults.standard.set(try? PropertyListEncoder().encode(EventManager.instance.favouriteEvents), forKey: "favouriteEvents")
    }
    
    
    func setupView(event: Event) {
        if cellValue == EventManager.instance.favouriteEvents[cellIndex] {
            setFavouriteButton.isHidden = true
        }
        
        backgroundView.layer.cornerRadius = 8
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowRadius = 10
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        
        setFavouriteButton.layer.cornerRadius = 7
        setFavouriteButton.layer.shadowOpacity = 1
        setFavouriteButton.layer.shadowRadius = 5
        setFavouriteButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        setFavouriteButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        
        switch event.isFavourite {
        case true:
            setFavouriteButton.setTitle("Remove from favourites", for: .normal)
        case false:
            setFavouriteButton.setTitle("Add to favourites", for: .normal)
        }
        
        switch event.category.name {
        case "Entertainment":
            backgroundView.backgroundColor = #colorLiteral(red: 1, green: 0.5818524957, blue: 0.576875627, alpha: 1)
        case "Music":
            backgroundView.backgroundColor = #colorLiteral(red: 0.5117003918, green: 0.8113348484, blue: 0.6468709111, alpha: 1)
        case "Exhibition":
            backgroundView.backgroundColor = #colorLiteral(red: 0.572827816, green: 0.7682645917, blue: 1, alpha: 1)
        case "Sport":
            backgroundView.backgroundColor = #colorLiteral(red: 0.6911192536, green: 0.5721891522, blue: 1, alpha: 1)
        default:
            backgroundView.backgroundColor = .gray
        }
    }

}

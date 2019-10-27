//
//  ItemTableViewCell.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/18/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventPlaceLabel: UILabel!
    @IBOutlet weak var eventCategoryLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    func configureCell(event: Event) {
        setupCellBackgroundView(event: event)
        
        eventNameLabel.text = event.name
        eventPlaceLabel.text = event.place
        eventCategoryLabel.text = event.category.name
        eventDateLabel.text = event.date
    }
    
    func setupCellBackgroundView(event: Event) {
        ViewController.setupViewLayer(view: cellView, cornerRadius: 8, shadowOpacity: 1, shadowRadius: 10, shadowOffset: CGSize(width: 0, height: 0), shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor)
        
        switch event.category.name {
        case CategoryType.Entertainment.value():
            cellView.backgroundColor = UIColor(named: "Pink")
        case CategoryType.Music.value():
            cellView.backgroundColor = UIColor(named: "Green")
        case CategoryType.Exhibition.value():
            cellView.backgroundColor = UIColor(named: "Blue")
        case CategoryType.Sport.value():
            cellView.backgroundColor = UIColor(named: "Purple")
        default:
            cellView.backgroundColor = .gray
        }
    }
    
}

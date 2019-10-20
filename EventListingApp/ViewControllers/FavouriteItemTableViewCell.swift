//
//  FavouriteItemTableViewCell.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/19/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import UIKit

class FavouriteItemTableViewCell: UITableViewCell {

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
        cellView.layer.cornerRadius = 8
        cellView.layer.shadowOpacity = 1
        cellView.layer.shadowRadius = 10
        cellView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        
        switch event.category.name {
        case "Entertainment":
            cellView.backgroundColor = #colorLiteral(red: 1, green: 0.5818524957, blue: 0.576875627, alpha: 1)
        case "Music":
            cellView.backgroundColor = #colorLiteral(red: 0.5117003918, green: 0.8113348484, blue: 0.6468709111, alpha: 1)
        case "Exhibition":
            cellView.backgroundColor = #colorLiteral(red: 0.572827816, green: 0.7682645917, blue: 1, alpha: 1)
        case "Sport":
            cellView.backgroundColor = #colorLiteral(red: 0.6911192536, green: 0.5721891522, blue: 1, alpha: 1)
        default:
            cellView.backgroundColor = .gray
        }
    }
}

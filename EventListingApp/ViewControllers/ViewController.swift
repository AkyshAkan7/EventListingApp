//
//  ViewController.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/16/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefault.loadData(key: "events")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    static func setupViewLayer(view: UIView, cornerRadius: CGFloat, shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize, shadowColor: CGColor) {
        view.layer.cornerRadius = cornerRadius
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowColor = shadowColor
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventManager.instance.events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableViewCell
        
        cell.configureCell(event: EventManager.instance.events[indexPath.row])
        
        return cell
    }
    
    // MARK: - segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToEventDetailsVCSegue" {
            if let viewController = segue.destination as? EventDetailsViewController, let index = tableView.indexPathForSelectedRow?.row {
                viewController.cellValue = EventManager.instance.events[index]
                viewController.cellIndex = index
            }
        }
    }

}


//
//  FavouriteViewController.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/19/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import UIKit

class FavouriteViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.value(forKey: "favouriteEvents") as? Data {
            EventManager.instance.favouriteEvents = try! PropertyListDecoder().decode(Array<Event>.self, from: data)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToEventDetailsVCFromFavouriteVCSegue" {
            if let viewController = segue.destination as? EventDetailsViewController, let index = tableView.indexPathForSelectedRow?.row {
                viewController.cellValue = EventManager.instance.favouriteEvents[index]
                viewController.cellIndex = index
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventManager.instance.favouriteEvents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! FavouriteItemTableViewCell
        
        cell.configureCell(event: EventManager.instance.favouriteEvents[indexPath.row])
        
        return cell
    }

}

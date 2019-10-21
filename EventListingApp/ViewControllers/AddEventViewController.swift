//
//  AddEventViewController.swift
//  EventListingApp
//
//  Created by Akan Akysh on 10/19/19.
//  Copyright © 2019 Akysh Akan. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var eventPlaceTextField: UITextField!
    @IBOutlet weak var eventDateTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameTextField.delegate = self
        eventDateTextField.delegate = self
        eventPlaceTextField.delegate = self
        
        setupView()
    }
    
    // MARK: - Actions
    @IBAction func saveEvent(_ sender: Any) {
        
        if let name = eventNameTextField.text,let description = descriptionTextView.text, let place = eventPlaceTextField.text,
            let date = eventDateTextField.text, let category = categoryButton.titleLabel?.text {
            EventManager.instance.events.append(Event(name: name, description: description, place: place, date: date, category: Category(name: category)))
            UserDefaults.standard.set(try? PropertyListEncoder().encode(EventManager.instance.events), forKey: "events")
        }
        
        let tableViewController = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as? ViewController
        self.navigationController?.pushViewController(tableViewController!, animated: true)
    }
    
    
    @IBAction func chooseCategory(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Choose category", message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let entertainmentCategory = UIAlertAction(title: "Entertainment", style: .default) { _ in
            self.categoryButton.setTitle("Entertainment", for: .normal)
            self.categoryButton.backgroundColor = #colorLiteral(red: 1, green: 0.5818524957, blue: 0.576875627, alpha: 1)
        }
        
        let musicCategory = UIAlertAction(title: "Music", style: .default) { _ in
            self.categoryButton.setTitle("Music", for: .normal)
            self.categoryButton.backgroundColor = #colorLiteral(red: 0.5117003918, green: 0.8113348484, blue: 0.6468709111, alpha: 1)
        }
        
        let exhibitionCategory = UIAlertAction(title: "Exhibition", style: .default) { _ in
            self.categoryButton.setTitle("Exhibition", for: .normal)
            self.categoryButton.backgroundColor = #colorLiteral(red: 0.572827816, green: 0.7682645917, blue: 1, alpha: 1)
        }
        
        let sportCategory = UIAlertAction(title: "Sport", style: .default) { action in
            self.categoryButton.setTitle("Sport", for: .normal)
            self.categoryButton.backgroundColor = #colorLiteral(red: 0.6911192536, green: 0.5721891522, blue: 1, alpha: 1)
        }
        
        actionSheet.addAction(entertainmentCategory)
        actionSheet.addAction(musicCategory)
        actionSheet.addAction(exhibitionCategory)
        actionSheet.addAction(sportCategory)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: - Methods or functions
    func setupView() {
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.layer.borderColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1).cgColor
        
        categoryButton.layer.cornerRadius = 8
        categoryButton.layer.shadowOpacity = 1
        categoryButton.layer.shadowRadius = 5
        categoryButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        categoryButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        
        saveButton.layer.cornerRadius = 7
        saveButton.layer.shadowOpacity = 1
        saveButton.layer.shadowRadius = 5
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        saveButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
    }

}

// MARK: - Delegates

extension AddEventViewController: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        eventNameTextField.resignFirstResponder()
        eventDateTextField.resignFirstResponder()
        eventPlaceTextField.resignFirstResponder()
        return true
    }
}

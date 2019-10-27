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
            UserDefault.saveData(key: "events")
        }
        
        let tableViewController = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as? ViewController
        self.navigationController?.pushViewController(tableViewController!, animated: true)
    }
    
    
    @IBAction func chooseCategory(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Choose category", message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let entertainmentCategory = UIAlertAction(title: CategoryType.Entertainment.value(), style: .default) { _ in
            self.categoryButton.setTitle(CategoryType.Entertainment.value(), for: .normal)
            self.categoryButton.backgroundColor = UIColor(named: "Pink")
        }
        
        let musicCategory = UIAlertAction(title: CategoryType.Music.value(), style: .default) { _ in
            self.categoryButton.setTitle(CategoryType.Music.value(), for: .normal)
            self.categoryButton.backgroundColor = UIColor(named: "Green")
        }
        
        let exhibitionCategory = UIAlertAction(title: CategoryType.Exhibition.value(), style: .default) { _ in
            self.categoryButton.setTitle(CategoryType.Exhibition.value(), for: .normal)
            self.categoryButton.backgroundColor = UIColor(named: "Blue")
        }
        
        let sportCategory = UIAlertAction(title: CategoryType.Sport.value(), style: .default) { action in
            self.categoryButton.setTitle(CategoryType.Sport.value(), for: .normal)
            self.categoryButton.backgroundColor = UIColor(named: "Purple")
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
        
        ViewController.setupViewLayer(view: categoryButton, cornerRadius: 8, shadowOpacity: 1, shadowRadius: 5, shadowOffset: CGSize(width: 0, height: 0), shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor)
        
        ViewController.setupViewLayer(view: saveButton, cornerRadius: 7, shadowOpacity: 1, shadowRadius: 5, shadowOffset: CGSize(width: 0, height: 0), shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor)
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

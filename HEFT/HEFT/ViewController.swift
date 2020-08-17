//
//  ViewController.swift
//  HEFT
//
//  Created by Naveen Budda on 7/31/20.
//  Copyright © 2020 HEFTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var statePicker: UIPickerView!
    
    
    var statePicked = ""
    var nameText = ""
    

    
    let states = ["Alaska",
    "Alabama",
    "Arkansas",
    "American Samoa",
    "Arizona",
    "California",
    "Colorado",
    "Connecticut",
    "District of Columbia",
    "Delaware",
    "Florida",
    "Georgia",
    "Guam",
    "Hawaii",
    "Iowa",
    "Idaho",
    "Illinois",
    "Indiana",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Massachusetts",
    "Maryland",
    "Maine",
    "Michigan",
    "Minnesota",
    "Missouri",
    "Mississippi",
    "Montana",
    "North Carolina",
    " North Dakota",
    "Nebraska",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "Nevada",
    "New York",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Puerto Rico",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Virginia",
    "Virgin Islands",
    "Vermont",
    "Washington",
    "Wisconsin",
    "West Virginia",
    "Wyoming"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePicked = states[row]
        print(statePicked)

    }
    
    override func viewDidLoad() {
        print(statePicked)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
        
    }
    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "homeToTable", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DesVC = segue.destination as! TableViewController
        DesVC.myState = statePicked
    }
    
    }






//
//  TableViewController.swift
//  HEFT
//
//  Created by Naveen Budda on 7/31/20.
//  Copyright © 2020 HEFTeam. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellDescript: UILabel!
    @IBOutlet var cellImage: UIImageView!
}

class TableViewController: UITableViewController {
    
    var myState = ""
    var myAbreev = ""
    
    var features : [Feature] = []
    
    func appendFeature(featureAppend : Feature) {
        features.append(featureAppend)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stateDictionary: [String : String] = [

            "Alabama": "AL",

            "Alaska": "AK",

            "American Samoa": "AS",

            "Arizona": "AZ",

            "Arkansas": "AR",

            "California": "CA",

            "Colorado": "CO",

            "Connecticut": "CT",

            "Delaware": "DE",

            "District of Columbia": "DC",

            "Florida": "FL",

            "Georgia": "GA",

            "Guam": "GU",

            "Hawaii": "HI",

            "Idaho": "ID",

            "Illinois": "IL",

            "Indiana": "IN",

            "Iowa": "IA",

            "Kansas": "KS",

            "Kentucky": "KY",

            "Louisiana": "LA",

            "Maine": "ME",

            "Maryland": "MD",

            "Massachusetts": "MA",

            "Michigan": "MI",

            "Minnesota": "MN",

            "Mississippi": "MS",

            "Missouri": "MO",

            "Montana": "MT",

            "Nebraska": "NE",

            "Nevada": "NV",

            "New Hampshire": "NH",

            "New Jersey": "NJ",

            "New Mexico": "NM",

            "New York": "NY",

            "North Carolina": "NC",

            "North Dakota": "ND",

            "Northern Mariana Islands":"MP",

            "Ohio": "OH",

            "Oklahoma": "OK",

            "Oregon": "OR",

            "Pennsylvania": "PA",

            "Puerto Rico": "PR",

            "Rhode Island": "RI",

            "South Carolina": "SC",

            "South Dakota": "SD",

            "Tennessee": "TN",

            "Texas": "TX",

            "Utah": "UT",

            "Vermont": "VT",

            "Virgin Islands": "VI",

            "Virginia": "VA",

            "Washington": "WA",

            "West Virginia": "WV",

            "Wisconsin": "WI",

            "Wyoming": "WY"

        ]

        
        var myAbreev = stateDictionary[myState]
        var apiWeb = ""
        if let realAbreev = myAbreev{
            apiWeb = "https://api.weather.gov/alerts/active?area=\(realAbreev)"
        }
        
        print(apiWeb)
        features = []
        print("Code Starting")
        if let url = URL(string: apiWeb) {
                URLSession.shared.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
                    if error == nil {
                        if data != nil {
                            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject] {
                                DispatchQueue.main.async {
                                    print("Json is starting to be decoded")
                                    //if let rawfeatures = json["features"] {
                                    var rawfeatures = json["features"] as! [Dictionary< String, AnyObject>]
                                    print("rawfeatures.count \(rawfeatures.count)")
                                    var keepgoingfeatures = rawfeatures.count
                                    var FeatureIndex = 0
                                    while keepgoingfeatures != 0{
                                        let currentRawFeature = rawfeatures[FeatureIndex]
                                        let currentRawFeatureProperties = currentRawFeature["properties"]
                                        
                                        let currentFeature = Feature()
                                        currentFeature.event = currentRawFeatureProperties!["event"] as? String ?? "Not Provided"
                                        currentFeature.description = currentRawFeatureProperties!["description"] as? String ?? "No Description Was Provided"
                                        currentFeature.instructions = currentRawFeatureProperties!["instruction"]  as? String ?? "No Instructions Were Provided"
                                        currentFeature.urgency = currentRawFeatureProperties!["urgency"] as? String ?? "Not Provided"
                                        
                                        self.appendFeature(featureAppend: currentFeature)
                                        
                                        keepgoingfeatures -= 1
                                        FeatureIndex += 1
                                        print("Before Print Current Feature")
                                        print(currentFeature.instructions)
                                        print("After Print Current Feature")
                                    }
                                print("going to reload data")
                                self.tableView.reloadData()
                                    self.title = "Alerts"
                                    print("did reload data")
                                }
                            }
                        }
                        
                        
                    } else {
                        print("We have an error")
                    }
                }.resume()
            }
        print("Code Over")
            
        print("features :\(features)")
        
        
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Table View Rows Configuring")
        // #warning Incomplete implementation, return the number of rows
        return features.count
        
    }
    
    override func tableView(_ tableView: UITableView,
             heightForRowAt indexPath: IndexPath) -> CGFloat {
     // Make the first row larger to accommodate a custom cell.
        return 180
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                print("Table View Loading")
        var cell = tableView.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath) as! TableViewCell
        
        let cellFeature = features[indexPath.row]

        cell.cellDescript?.text = cellFeature.urgency
        cell.cellImage?.image = UIImage(named: "842e66eb-c73a-4b05-bca7-fac501d4079d (4)")
        cell.cellTitle?.text = cellFeature.event
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let myAlert = features[indexPath.row]
            
           performSegue(withIdentifier: "tableToInfo", sender: myAlert)
       }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DesVC = segue.destination as! InfoViewController
        let myAlert = sender as! Feature
        DesVC.myAlert = myAlert
    }
    
}

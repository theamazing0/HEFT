//
//  InfoViewController.swift
//  HEFT
//
//  Created by Samvid Konchada on 8/2/20.
//  Copyright © 2020 HEFTeam. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    

    @IBOutlet var eventLabel: UILabel!
    var myAlert = Feature()
    var myOption = ""
    @IBOutlet var urgencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(myAlert.event)
        eventLabel.text = myAlert.event
        urgencyLabel.text = myAlert.urgency
        
    }
    @IBAction func InfoClicked(_ sender: Any) {
        myOption = "Instructions"
        performSegue(withIdentifier: "toI", sender: myAlert)
    }
    
    
    
    @IBAction func DescriptClicked(_ sender: Any) {
        myOption = "Description"
        performSegue(withIdentifier: "toI", sender: myAlert)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DesVC = segue.destination as! InformationViewController
        let myAlert = sender as! Feature
        DesVC.myAlert = myAlert
        DesVC.option = myOption
        
    }
    
}

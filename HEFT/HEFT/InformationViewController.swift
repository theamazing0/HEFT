//
//  InformationViewController.swift
//  HEFT
//
//  Created by Samvid Konchada on 8/2/20.
//  Copyright © 2020 HEFTeam. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    var myAlert = Feature()
    var option = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        if option == "Instructions"{
            title = "Instructions"
            label.text = myAlert.instructions
        } else {
            title = "Description"
            label.text = myAlert.description
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

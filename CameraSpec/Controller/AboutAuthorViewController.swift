//
//  AboutAuthorViewController.swift
//  CameraSpec
//
//  Created by metalbee on 6/22/20.
//  Copyright © 2020 sanengineer. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController {
    
    @IBOutlet weak var aboutPhoto: UIImageView!
    @IBOutlet weak var aboutName: UILabel!
    @IBOutlet weak var aboutEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "About"
        
        aboutName.text = "San Engineer"
        aboutEmail.text = "sanengineer@xxx.com"
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

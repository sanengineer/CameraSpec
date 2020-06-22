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

        // Do any additional setup after loading the view.
        self.navigationItem.title = "About"
        
        aboutPhoto.layer.cornerRadius = 6
        aboutPhoto.clipsToBounds = true
        aboutName.text = "Ikhsan Sugiarto"
        aboutEmail.text = "sanenginer@gmail.com"
    }
}

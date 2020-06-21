//
//  DetailViewController.swift
//  CameraSpec
//
//  Created by metalbee on 6/21/20.
//  Copyright © 2020 sanengineer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameCamera: UILabel!
    @IBOutlet weak var photoCamera: UIImageView!
    @IBOutlet weak var descCamera: UILabel!
    
    // Menampung Data Sementara
    var camera: Camera?
    
    // Membuat Konstanta Untuk Tombol Back
    let backButton = UIBarButtonItem()
    
    // ??
    // let attributedString = NSMutableAttributedString()
    
    // ??
    let paragraphStyle = NSMutableParagraphStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Digunakan untuk menetapkan nilai camera ke beberapa view yang ada
        if let result = camera {
            photoCamera.image = result.photo
            nameCamera.text = result.name
            descCamera.text = result.description
        }
        
        // Membuat Tampilan Navigation Bar Menjadi Besar
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Menambahkan Title Pada Navigation Bar
        self.navigationItem.title = "Detail Camera"
        
        // Mengganti Title Default Tombol Back
        self.backButton.title = "List Camera"
        
        // ????
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        // ??
        photoCamera.layer.cornerRadius = 4
        photoCamera.clipsToBounds = true
        
        // Set Line Height
        // paragraphStyle.lineSpacing = 1.5
        
        // ??
        // attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        // ??
        // descCamera.attributedText = attributedString
        
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
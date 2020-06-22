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
        
        descCamera.setLineSpacing(lineSpacing: 0, lineHeightMultiple: 1.5)
        
    }

}

extension UILabel {
    
    // Pass value for any one of both parameters and see result
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}

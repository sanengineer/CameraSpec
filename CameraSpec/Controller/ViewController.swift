//
//  ViewController.swift
//  CameraSpec
//
//  Created by metalbee on 6/17/20.
//  Copyright © 2020 sanengineer. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var cameraTableView: UITableView!
    @IBOutlet weak var aboutAuthor: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchCamera = cameraMany
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ??
        cameraTableView.dataSource = self
        
        // Menghubungkan berkas XIB untuk CameraTableViewCell dengan CameraTableView
        cameraTableView.register(UINib(nibName: "CameraTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraCell")
        
        // ??
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // ??
        self.navigationItem.title = "List Camera"
        
        // Menambahkan Delegate Ke Table View
        cameraTableView.delegate = self
        
    }
    
    
    @IBAction func aboutAuthor(_ sender: Any) {
    
        let aboutAuthorFunc = AboutAuthorViewController(nibName: "AboutAuthorViewController", bundle: nil)
        
        self.navigationController?.pushViewController(aboutAuthorFunc, animated: true)
        
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            
            return searchCamera.count
       
        } else {
            
            // Menambahkan Total Item Yang Akan Muncul Di Dalam Table View
            return cameraMany.count
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Menghubungkan Cell dengan Identifier "CameraCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "CameraCell", for: indexPath) as? CameraTableViewCell
        
        // Menetapkan Nilai Hero Ke View Di Dalam Cell
        let camera = cameraMany[indexPath.row]
        
        // ??
        if searching {
            cell?.nameCamera.text = searchCamera[indexPath.row]
        } else {
            
            // Memasukkan Data Ke Setiap View Dan Label Yang Ada
            cell?.photoCamera.image = camera.photo
            cell?.nameCamera.text = camera.name
            cell?.descCamera.text = camera.description
        }
        
        
        
        
        // Membuat ImageView Mempunyai Radius
        cell?.photoCamera.layer.cornerRadius = 4
        cell?.photoCamera.clipsToBounds = true
        
        return cell!
        
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Memanggil View Controller Dengan Berkas NIB/XIB Didalamnya
        let detail = DetailViewController(nibName:"DetailViewController", bundle: nil)
        
        // Mengirim Data Camera
        detail.camera = cameraMany[indexPath.row]
        
        // Mendorong View Controller Lain
        self.navigationController?.pushViewController(detail, animated: true)
        
        // Menghilangkan Warna Background Pada Cell Yang Sudah Dipilih
        tableView.deselectRow(at: indexPath , animated: true)
        
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        

    }
}

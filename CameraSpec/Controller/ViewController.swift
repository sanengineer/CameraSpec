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
    //@IBOutlet weak var searchBar: UISearchBar!
    
    var cameras: [Camera] = []

//    let searchController = UISearchController(searchResultsController: nil)
    var searchController: UISearchController!
    var resultController = UIViewController()
    
    var filteredCamera: [Camera] = []
    
    var isSearchBarEmpty: Bool {
//        return searchController.searchBar.text?.isEmpty ?? true
        return false
    }
    
    var isFiltering: Bool {
        return searchController.isActive
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ??
        cameraTableView.dataSource = self
        
        // Menghubungkan berkas XIB untuk CameraTableViewCell dengan CameraTableView
        cameraTableView.register(UINib(nibName: "CameraTableViewCell", bundle: nil), forCellReuseIdentifier: "CameraCell")
        
        // Menambahkan Delegate Ke Table View
        cameraTableView.delegate = self
//
//        let camera: Camera
//
//        if isFiltering {
//            camera = filteredCamera[IndexPath.row]
//        } else {
//            camera = cameras[IndexPath.row]
//        }
//         cameraTableView.camera = camera
        
        
        // ??
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // ??
        self.navigationItem.title = "List Camera"
        
        // ??
         searchController = UISearchController(searchResultsController: self.resultController)
        
        // ??
//        cameraTableView.tableHeaderView = self.searchController.searchBar
        navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Camera"
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        
//        navigationItem.searchController = searchController
        
    }
    
    
    
    
    @IBAction func aboutAuthor(_ sender: Any) {
    
        let aboutAuthorFunc = AboutAuthorViewController(nibName: "AboutAuthorViewController", bundle: nil)
        
        self.navigationController?.pushViewController(aboutAuthorFunc, animated: true)
        
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
        filteredCamera = cameraMany.filter { (camera: Camera) -> Bool in
        
            if isSearchBarEmpty {
                return true
            } else {
                return camera.name.lowercased().contains(searchText.lowercased())
            }
        
    }
        
        cameraTableView.reloadData()
    
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                let indexPath = cameraTableView.indexPathForSelectedRow,
//                let detailCameraViewController = DetailViewController.self
//
//                let camera: Camera
//                if isFiltering {
//                camera = filteredCamera[indexPath.row]
//                            } else {
//                camera = cameraMany[indexPath.row]
//                            }
//                detailCameraViewController.camera = camera
//    }
    
}


extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
     
        let searchBar = searchController.searchBar
        
        // Filtering Search
        filterContentForSearchText(searchBar.text!)
        
        // ??
        cameraTableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        // ??
        if isFiltering {
            return filteredCamera.count
            
        } else {
            
             // Menambahkan Total Item Yang Akan Muncul Di Dalam Table View
            return cameraMany.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Menghubungkan Cell dengan Identifier "CameraCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "CameraCell", for: indexPath) as? CameraTableViewCell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CameraCell", for: indexPath)
//
        let camera: Camera
        
        if isFiltering {
            
            // Menetapkan Nilai Hero Ke View Di Dalam Cell
            // let camera = cameraMany[indexPath.row]
            
            camera = filteredCamera[indexPath.row]
            
        } else {
            
            camera = cameraMany[indexPath.row]

        }
        
        // Memasukkan Data Ke Setiap View Dan Label Yang Ada
        cell?.photoCamera.image = camera.photo
        cell?.nameCamera.text = camera.name
        cell?.descCamera.text = camera.description
        
      
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
        
        if isFiltering {
             detail.camera = filteredCamera[indexPath.row]
        } else {
            detail.camera = cameraMany[indexPath.row]
        }

        // Mengirim Data Camera
//        detail.camera = cameraMany[indexPath.row]
        
        // Mendorong View Controller Lain
        self.navigationController?.pushViewController(detail, animated: true)
        
//        if isFiltering {
//            self.navigationController?.pushViewController(detail, animated: true)
//        }
        
        // Menghilangkan Warna Background Pada Cell Yang Sudah Dipilih
        tableView.deselectRow(at: indexPath , animated: true)
        
    }
}


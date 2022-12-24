//
//  ViewController.swift
//  Project-1
//
//  Created by Đức Anh Trần on 23/12/2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    var x = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bla Bla"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        var content = cell.defaultContentConfiguration()
        content.text = "Picture \(indexPath.row + 1)"
        cell.contentConfiguration = content
        
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        vc.selectedPicture = pictures[indexPath.row]
        vc.selectedPictureNumber = indexPath.row
        vc.totalPictures = pictures.count
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


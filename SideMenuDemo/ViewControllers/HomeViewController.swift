//
//  HomeViewController.swift
//  SideMenuDemo
//
//  Created by Mohamed Korany on 7/29/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    let products = [Product(name: "Mobile", price: 2000) , Product(name: "PC", price: 6000) ,Product(name: "TV", price: 3000 ) ,Product(name: "Labtop", price: 5000) ,Product(name: "vacuum cleaner", price: 1500) ,Product(name: "Mobile", price: 2000)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIOnchangeLanguage()
    }

}

extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:  indexPath) as UITableViewCell
        cell.textLabel?.text = products[indexPath.row].name
        cell.detailTextLabel?.text = String(products[indexPath.row].price)
        return cell
    }
}

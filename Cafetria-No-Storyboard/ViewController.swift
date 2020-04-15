//
//  ViewController.swift
//  Cafetria-No-Storyboard
//
//  Created by MahmoudRamadan on 4/14/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView : UITableView!
    var cafeterias: [Cafteria] = []
    
    let reuseIdentifier = "cafeteriaCell"
    let cellHeight : CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Cafetria"
        
        //init data
        
        let cafe1 = Cafteria(name: "cafe#1", rating: .bad)
        let cafe2 = Cafteria(name: "cafe#2", rating: .good)
        let cafe3 = Cafteria(name: "cafe#3", rating: .moderate)
        let cafe4 = Cafteria(name: "cafe#4", rating: .great)
        
        cafeterias = [cafe1,cafe2,cafe3,cafe4]
        
        //add table view to viewcontroller
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    
        setupConstrinats()
    }
    
   
    
    func setupConstrinats(){
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
}
//data source
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("section :\(indexPath.section) and row \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CustomTableViewCell
        cell.configure(for: cafeterias[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
}

//delegate

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print("selected")
        let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
        
        let cafe = cafeterias[indexPath.row]
        cafe.isFavorite.toggle()
        cell.toggleHeart(for : cafe.isFavorite)
        
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       // print("de deselected")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}


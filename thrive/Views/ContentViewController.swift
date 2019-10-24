//
//  ContentViewController.swift
//  thrive
//
//  Created by Mitch on 21/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit

class ContentViewController: UITableViewController {
     private let customRefreshControl = UIRefreshControl()
     private let spiner = UIActivityIndicatorView(style: .gray)
}
extension ContentViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }
}
private extension ContentViewController{
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(UINib(nibName: "cellItem", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        if #available(iOS 10.0, *) {
            tableView.refreshControl = customRefreshControl
        } else {
            // Fallback on earlier versions
        }
    }
    
    
}
extension ContentViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}

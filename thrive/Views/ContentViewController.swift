//
//  ContentViewController.swift
//  thrive
//
//  Created by Mitch on 21/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
import SwiftyJSON

class ContentViewController: UITableViewController {
    var content = JSON()
    var firstName = "JOHN"

}
extension ContentViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func UpdateData(contentJson: JSON) {
        content = contentJson
        tableView.reloadData()
        if let name = content["name"].stringValue.split(separator: " ").first?.uppercased(){
            firstName = String(name)
        }
    }
}

private extension ContentViewController{
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(UINib(nibName: "cellItem", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
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
        cell?.contentImageView.imageFromUrl(url: content["image"].stringValue)
        cell?.contentNameLabel.text = content["name"].stringValue
        cell?.contentLocationLabel.text = content["location"].stringValue
        cell?.contentDistanceLabel.text = "\(content["distance"].stringValue) Kilometres away"
        cell?.contentTextView.text = content["details"].stringValue
        cell?.contentShareLabel.text = "SHARE \(firstName)'S PROFILE"
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}

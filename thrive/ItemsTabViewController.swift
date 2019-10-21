//
//  ItemsTabViewController.swift
//  thrive
//
//  Created by Mitch on 05/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
import SwiftyJSON

class ItemsTabViewController: UIViewController{

    @IBOutlet weak var barCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        barCollectionView.dataSource = self
        barCollectionView.delegate = self
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        if let url = Bundle.main.url(forResource: "mock", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let json = try JSON(data: data , options: .allowFragments)
                guard let jsonArray = json.array else {
                    return
                }
                AppValues.jsonData = jsonArray
                AppValues.itemCount = jsonArray.count
            }
            catch {
                //No op
            }
        }
    }
}
extension ItemsTabViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppValues.jsonData.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemscell", for: indexPath) as? ItemsCollectionViewCell
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: barCollectionView.frame.size.width, height: barCollectionView.frame.size.height)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        <#code#>
    }
}

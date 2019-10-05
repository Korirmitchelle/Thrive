//
//  HomeViewController.swift
//  thrive
//
//  Created by Mitch on 02/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    var cells = 5
    let buttonImageNames = ["ic_refresh","ic_cancel","ic_star","ic_like","ic_thunder"]
    @IBOutlet weak var buttonsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsCollectionView.delegate = self
        buttonsCollectionView.dataSource = self
    }
}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonscell", for: indexPath) as? ButtonsCollectionViewCell
        cell?.buttonImageView.image = UIImage(named: buttonImageNames[indexPath.row])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets = self.buttonsCollectionView.contentInset
        let frameWidth = self.view.frame.size.width
        let  collectionViewWidth = (self.buttonsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width
        var  leftInsets = (frameWidth - (collectionViewWidth * CGFloat(cells))) * 0.5 - (CGFloat(cells-1) * 5)
        if leftInsets <= 0 {
            leftInsets = 0
        }
        insets.left = leftInsets
        return insets
        
    }
    
    
    
}

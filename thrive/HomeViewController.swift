//
//  HomeViewController.swift
//  thrive
//
//  Created by Mitch on 02/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    //Number of bottom buttons
    var cells = 5
    let buttonImageNames = ["ic_refresh","ic_cancel","ic_star","ic_like","ic_thunder"]
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var buttonsCollectionView: UICollectionView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var counterView: UIView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsCollectionView.delegate = self
        buttonsCollectionView.dataSource = self
        showLoader()
        Common.delay(3){
            self.hideLoader()
        }
    }
    
    func showLoader(){
        containerView.isHidden = true
        loadingView.isHidden = false
        counterView.isHidden = true
    }
    func hideLoader(){
        containerView.isHidden = false
        loadingView.isHidden = true
        counterView.isHidden = false
        counterLabel.text = String(AppValues.itemCount)
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
        //Align buttons to the center
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

//
//  ItemsTabViewController.swift
//  thrive
//
//  Created by Mitch on 05/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ItemsTabViewController: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var barCollectionView: UICollectionView!
    override func viewDidLoad() {
        loadStyles()
        super.viewDidLoad()
        datasource = self
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        //Set number of items
        var viewControllerArray = [UIViewController]()
        for _ in 1...AppValues.itemCount{
            let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "swipableContentViewController")
            viewControllerArray.append(view)
        }
        return viewControllerArray
    }
    
    func loadStyles(){
        settings.style.buttonBarBackgroundColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarHeight = 5
        settings.style.selectedBarVerticalAlignment = .bottom
        settings.style.buttonBarMinimumLineSpacing = 10
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = UIColor.purple
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
}

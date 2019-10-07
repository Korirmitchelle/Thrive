//
//  SwipableContentViewController.swift
//  thrive
//
//  Created by Mitch on 05/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class SwipableContentViewController: UIViewController {
    @IBOutlet weak var scrollableView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentNameLabel: UILabel!
    @IBOutlet weak var contentLocationLabel: UILabel!
    @IBOutlet weak var contentDistanceLabel: UILabel!
    var content: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension SwipableContentViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo.init(title: "")
    }
}

//
//  ItemsTabViewController.swift
//  thrive
//
//  Created by Mitch on 05/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
import SwipeMenuViewController


class ItemsTabViewController: UIViewController {
    
    @IBOutlet var swipeMenuView: SwipeMenuView!
    private var datas: [String] = ["Bulbasaur","Caterpie", "Golem", "Jynx", "Marshtomp", "Salamence", "Riolu", "Araquanid"]
    private var arrayControllers = [String : ContentViewController]()

    var options = SwipeMenuViewOptions()
    var dataCount: Int = 5
    
    
    override func viewDidLoad() {
        datas.forEach { data in
            let vc = ContentViewController()
            vc.title = data
            arrayControllers[data] = vc
            self.addChild(vc)
        }
        super.viewDidLoad()
        swipeMenuView.delegate = self
        swipeMenuView.dataSource = self
        view.backgroundColor = UIColor.white
    }
    
    private func reload() {
        swipeMenuView.reloadData(options: options)
    }
    
    
}
extension ItemsTabViewController:SwipeMenuViewDataSource,SwipeMenuViewDelegate{
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        
    }
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        
    }
    
    
    
    // MARK - SwipeMenuViewDataSource
    
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return dataCount
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return children[index].title ?? ""
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = children[index]
        vc.didMove(toParent: self)
        return vc
    }
}

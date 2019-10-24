//
//  ItemsTabViewController.swift
//  thrive
//
//  Created by Mitch on 05/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import UIKit
import SwipeMenuViewController
import SwiftyJSON


class ItemsTabViewController: UIViewController {
    
    @IBOutlet var swipeMenuView: SwipeMenuView!
    var isLoaded = false

    private var datas: [String] = ["cat1","Cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8","cat9","cat10", "cat11", "cat12", "cat13", "cat14", "cat15", "cat16"]
    private var arrayControllers = [String : ContentViewController]()

    var options = SwipeMenuViewOptions()
    var dataCount: Int = 5
    
    
    override func viewDidLoad() {
        options.tabView.additionView.underline.height = 5
        options.tabView.additionView.backgroundColor = .lightGray
        options.tabView.style = .segmented
        options.tabView.height = 5
        datas.forEach { data in
            let vc = ContentViewController()
            vc.title = ""
            arrayControllers[data] = vc
            self.addChild(vc)
        }
        super.viewDidLoad()
        swipeMenuView.delegate = self
        swipeMenuView.dataSource = self
        swipeMenuView.tabView?.clipsToBounds = false
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name(rawValue: "reload"), object: nil)
        view.backgroundColor = UIColor.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !isLoaded{
            loadData()
            isLoaded = true
        }
    }
    
    func loadData(){
        if let url = Bundle.main.url(forResource: "mockdata", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let json = try JSON(data: data , options: .allowFragments)
                guard let jsonArray = json.array else {
                    return
                }
                AppValues.currentItemJson = jsonArray
                AppValues.itemCount = jsonArray.count
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
                for (index,category) in datas.enumerated(){
                    let vc = arrayControllers[category]
                    vc?.UpdateData(contentJson: jsonArray[index])
                }
            }
            catch {
                //No op
            }
        }
    }
    
    @objc func reload() {
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
        return AppValues.currentItemJson.count
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

//
//  ViewController.swift
//  thrive
//
//  Created by dan on 9/30/19.
//  Copyright © 2019 dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goToLoad(_ sender: Any) {
        goToPage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func goToPage(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeviewcontroller") as! HomeViewController
        self.present(vc, animated: false, completion: nil)
    }

}


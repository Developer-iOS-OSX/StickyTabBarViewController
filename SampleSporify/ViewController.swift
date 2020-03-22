//
//  ViewController.swift
//  SampleSporify
//
//  Created by Emre Havan on 20.03.20.
//  Copyright © 2020 Emre Havan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tabController: MainTabBarController? {
        if let tabBarController = tabBarController as? MainTabBarController {
            return tabBarController
        }
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapped(_ sender: Any) {
        tabController?.configureCollapsedTrainingView()
    }
    
    @IBAction func removerTapped(_ sender: Any) {
        tabController?.removeCollapsedView()
    }
}

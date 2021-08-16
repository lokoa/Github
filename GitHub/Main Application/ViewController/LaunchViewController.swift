//
//  LaunchViewController.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit

class LaunchViewController: UINavigationController {
    
    // MARK: ViewController lifecicle
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return UIStatusBarStyle.lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setNavigationBar()
        self.pushViewController(MainViewController(), animated: true)
    }
    
    func setNavigationBar() {
        navigationBar.isTranslucent = true
        navigationBar.tintColor = Color.brand
    }
}

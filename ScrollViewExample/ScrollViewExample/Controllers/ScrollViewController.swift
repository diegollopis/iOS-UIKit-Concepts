//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by Mobile2you on 28/12/21.
//

import UIKit

class ScrollViewController: UIViewController {
    
    lazy var mainView: MainView = {
        let main = MainView()
        return main
    }()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
}


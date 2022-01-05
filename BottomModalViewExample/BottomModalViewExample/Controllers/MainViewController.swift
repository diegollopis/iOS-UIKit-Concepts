//
//  ViewController.swift
//  BottomModalViewExample
//
//  Created by Mobile2you on 31/12/21.
//

import UIKit

class MainViewController: UIViewController {
        
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
        mainView.delegate = self
    }
}

extension MainViewController: MainViewButtonProtocol {
    
    func getStartedButtonAction() {
        let vc = BottomModalViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
}




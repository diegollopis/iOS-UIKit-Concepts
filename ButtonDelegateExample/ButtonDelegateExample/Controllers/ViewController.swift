//
//  ViewController.swift
//  teste
//
//  Created by Mobile2you on 27/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var content: ContentView = {
        let content = ContentView()
        return content
    }()
    
    override func loadView() {
        view = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        content.configButtonDelegate(delegate: self)
    }
}

extension ViewController: ButtonProtocol {
    
    func buttonAction() {
        print("botão clicado na view controller!!!")
    }
}

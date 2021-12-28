//
//  ViewController.swift
//  StackViewExample
//
//  Created by Mobile2you on 26/12/21.
//

import UIKit

class ButtonViewController: UIViewController {
        
    lazy var screen: TitleButtonView = {
        let view = TitleButtonView()
        return view
    }()
    
    override func loadView() {
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        screen.delegate = self
    }
}

extension ButtonViewController: ButtonActionProtocol {
    
    func buttonAction(_ sender: UIButton) {
        let title = sender.title(for: .normal) ?? ""
        print("Botão \(title) clicado.")
    }
}

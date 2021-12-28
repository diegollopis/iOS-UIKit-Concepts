//
//  ButtonView.swift
//  teste
//
//  Created by Mobile2you on 27/12/21.
//

import UIKit

protocol ButtonProtocol: AnyObject {
    func buttonAction()
}

class ButtonView: UIButton {
    
    weak var delegate: ButtonProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configButton() {
        setTitle("Click", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel!.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        backgroundColor = .red
        layer.cornerRadius = 8
        addTarget(self, action: #selector(configButtonAction), for: .touchUpInside)
    }
    
    @objc func configButtonAction() {
        delegate?.buttonAction()
    }
}

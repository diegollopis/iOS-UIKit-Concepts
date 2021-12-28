//
//  ContentView.swift
//  teste
//
//  Created by Mobile2you on 27/12/21.
//

import UIKit
import SnapKit

class ContentView: UIView {
        
    lazy var button: ButtonView = {
        let button = ButtonView()
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configButtonDelegate(delegate: ButtonProtocol) {
        button.delegate = delegate
    }
}

extension ContentView: ViewCode {
    
    func configView() {
        addSubview(button)
    }
    
    func configConstraints() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(200)
        }
    }
}

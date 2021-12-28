//
//  StackView.swift
//  StackViewExample
//
//  Created by Mobile2you on 27/12/21.
//

import UIKit

class StackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configStackView() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 3
    }
}

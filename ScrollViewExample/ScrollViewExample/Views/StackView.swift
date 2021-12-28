//
//  StackView.swift
//  ScrollViewExample
//
//  Created by Mobile2you on 28/12/21.
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
        alignment = .center
        spacing = 10
    }
}

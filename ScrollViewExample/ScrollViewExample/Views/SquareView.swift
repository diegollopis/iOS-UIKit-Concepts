//
//  SquareView.swift
//  ScrollViewExample
//
//  Created by Mobile2you on 28/12/21.
//

import UIKit

class SquareView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configSquareView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSquareView() {
        backgroundColor = .blue
        layer.cornerRadius = 8
    }
}

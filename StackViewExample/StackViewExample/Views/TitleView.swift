//
//  TitleView.swift
//  StackViewExample
//
//  Created by Mobile2you on 27/12/21.
//

import UIKit

class TitleView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTitle() {
        text = "Xylophone"
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 24)
    }
}

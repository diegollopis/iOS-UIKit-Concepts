//
//  FirstView.swift
//  CoordinatorsBasicExample
//
//  Created by Diego Llopis on 06/09/22.
//

import UIKit
import SnapKit

class FirstView: UIView {
    
    //MARK: - Layout Variables
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "First View"
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        return label
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.setTitle("Next", for: .normal)
        return button
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - FirstView Extension - Layout Setup
extension FirstView {
    
    func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(nextButton)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(100)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(title)
            make.height.equalTo(50)
        }
    }
}

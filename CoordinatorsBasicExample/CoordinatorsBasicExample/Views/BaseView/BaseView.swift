//
//  BaseView.swift
//  CoordinatorsBasicExample
//
//  Created by M2Y on 09/09/22.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    //MARK: - Layout Variables
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    lazy var aboveButtonLabel: UILabel = {
        let label = UILabel()
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - BaseView Extension - Layout Setup
extension BaseView {
    
    private func setupView() {
        
        addSubview(stackView)
        stackView.addArrangedSubview(aboveButtonLabel)
        stackView.addArrangedSubview(nextButton)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalTo(nextButton)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(aboveButtonLabel)
            make.height.equalTo(50)
        }
    }
}

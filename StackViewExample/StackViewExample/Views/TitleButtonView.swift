//
//  TitleView.swift
//  StackViewExample
//
//  Created by Mobile2you on 26/12/21.
//

import UIKit

protocol ButtonActionProtocol: AnyObject {
    func buttonAction(_ sender: UIButton)
}

class TitleButtonView: UIView {
    
    var delegate: ButtonActionProtocol?
    
    let colors:[UIColor] = [.red, .orange, .systemYellow, .green, .blue, .purple, .systemPink, .red, .orange, .systemYellow]
    
    let id:[String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    
    lazy var title: TitleView = {
        let title = TitleView()
        return title
    }()
    
    lazy var stackView: StackView = {
        let stackView = StackView()
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configButton(index: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(id[index], for: .normal)
        button.backgroundColor = colors[index]
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(configButtonAction), for: .touchUpInside)
        return button
    }
    
    func AddButtonsToStackView(amount: Int) {
        for i in 0..<amount {
            let button = configButton(index: i)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc func configButtonAction(_ sender: UIButton) {
        delegate?.buttonAction(sender)
    }
}

extension TitleButtonView: ViewCode {
    
    func configView() {
        addSubview(title)
        addSubview(stackView)
        AddButtonsToStackView(amount: 10)
    }
    
    func configConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(5)
            make.trailing.equalTo(self.snp.trailing).inset(5)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(10)
        }
    }
}

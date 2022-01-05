//
//  MainView.swift
//  BottomModalViewExample
//
//  Created by Mobile2you on 31/12/21.
//

import UIKit

protocol MainViewButtonProtocol: AnyObject {
    func getStartedButtonAction()
}

class MainView: UIView {
        
    var stackViewComponents = [Any]()
        
    weak var delegate: MainViewButtonProtocol?
    
    lazy var stackView: UIStackView = {
        lazy var stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 20
        return stack
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.text = "Lorem Ipsulum"
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return title
    }()
    
    lazy var text: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.textAlignment = .justified
        text.numberOfLines = 0
        text.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        return text
    }()
    
    lazy var spacer: UIView = {
        let spacer = UIView()
        return spacer
    }()
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        stackViewComponents = [title, text, spacer, getStartedButton ]
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func getStartedButtonTapped() {
        delegate?.getStartedButtonAction()
    }
}

extension MainView: ViewCode {
    
    func configView() {
        addSubview(stackView)
        for view in stackViewComponents {
            stackView.addArrangedSubview(view as! UIView)
        }
    }
    
    func configConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalTo(self.snp.leading).offset(24)
            make.trailing.equalTo(self.snp.trailing).inset(24)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
        
        getStartedButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}

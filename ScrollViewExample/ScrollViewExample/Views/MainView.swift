//
//  MainView.swift
//  ScrollViewExample
//
//  Created by Mobile2you on 28/12/21.
//

import UIKit

class MainView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
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
}

extension MainView: ViewCode {
    
    func configView() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        for _ in 1...20 {
            let square = SquareView()
            stackView.addArrangedSubview(square)
        }
    }
    
    func configConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        for view in stackView.arrangedSubviews {
            view.snp.makeConstraints { make in
                make.width.equalTo(80)
                make.height.equalTo(80)
            }
        }
    }
}

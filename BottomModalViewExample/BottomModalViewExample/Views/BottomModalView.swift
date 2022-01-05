//
//  BottomModalView.swift
//  BottomModalViewExample
//
//  Created by Mobile2you on 31/12/21.
//

import UIKit
import SnapKit

class BottomModalView: UIView {
        
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        containerView.clipsToBounds = true
        return containerView
    }()
    
    lazy var containerViewIndicator: UIView = {
        let indicator = UIView()
        indicator.backgroundColor = .black
        indicator.layer.cornerRadius = 4
        return indicator
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    let defaultHeight: CGFloat = 300
    
    //Dynamic container constraint
    var containerViewHeightConstraint: Constraint?
    var containerViewBottomConstraint: Constraint?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomModalView: ViewCode {
    
    func configView() {
        addSubview(dimmedView)
        addSubview(containerView)
        containerView.addSubview(containerViewIndicator)
    }
    
    func configConstraints() {
        
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            containerViewHeightConstraint = make.height.equalTo(defaultHeight).constraint
            containerViewBottomConstraint = make.bottom.equalTo(defaultHeight).constraint
        }
        
        containerViewIndicator.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(5)
            make.top.equalTo(containerView.snp.top).offset(10)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
}

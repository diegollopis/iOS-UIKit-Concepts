//
//  ThirdViewController.swift
//  CoordinatorsBasicExample
//
//  Created by Diego Llopis on 08/09/22.
//

import UIKit
import RxSwift
import RxGesture

protocol ThirdViewControllerDelegate: AnyObject {
    func didTapNext()
}

//MARK: - FirstViewController
class ThirdViewController: BaseViewController {
    
    //MARK: - Variables
    weak var delegate: ThirdViewControllerDelegate?
    
    //MARK: - Init
    convenience init(delegate: ThirdViewControllerDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    //MARK: - Setup Functions
    override func setupNextButtonAction() {
        super.setupNextButtonAction()
        self.delegate?.didTapNext()
    }
    
    override func setupNavBarTitle(){
        super.setupNavBarTitle()
        title = "Third View"
    }
    
    override func setupAboveButtonLabel() {
        super.setupAboveButtonLabel()
        screenView.aboveButtonLabel.text = "Third View Button"
    }
    
    override func setupScreenBackgroundColor() {
        super.setupScreenBackgroundColor()
        screenView.backgroundColor = .green
    }
}


//
//  SecondViewController.swift
//  CoordinatorsBasicExample
//
//  Created by Diego Llopis on 08/09/22.
//

import UIKit
import RxSwift
import RxGesture

//MARK: - FirstViewControler Delegate
protocol SecondViewControllerDelegate: AnyObject {
    func didTapNext()
}

//MARK: - FirstViewController
class SecondViewController: BaseViewController {
    
    //MARK: - Variables
    weak var delegate: SecondViewControllerDelegate?
    
    //MARK: - Init
    convenience init(delegate: SecondViewControllerDelegate) {
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
        title = "Second View"
    }
    
    override func setupAboveButtonLabel() {
        super.setupAboveButtonLabel()
        screenView.aboveButtonLabel.text = "Second View Button"
    }
    
    override func setupScreenBackgroundColor() {
        super.setupScreenBackgroundColor()
        screenView.backgroundColor = .orange
    }
}


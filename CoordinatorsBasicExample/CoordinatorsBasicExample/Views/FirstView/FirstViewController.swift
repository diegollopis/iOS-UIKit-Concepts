//
//  ViewController.swift
//  CoordinatorsBasicExample
//
//  Created by Diego Llopis on 06/09/22.
//

import UIKit
import RxSwift
import RxGesture

//MARK: - FirstViewControler Delegate
protocol FirstViewControllerDelegate: AnyObject {
    func didTapNext()
}

//MARK: - FirstViewController
class FirstViewController: BaseViewController {
    
    //MARK: - Variables
    weak var delegate: FirstViewControllerDelegate?
    
    //MARK: - Init
    convenience init(delegate: FirstViewControllerDelegate) {
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
        title = "First View"
    }
    
    override func setupAboveButtonLabel() {
        super.setupAboveButtonLabel()
        screenView.aboveButtonLabel.text = "First View Button"
    }
    
    override func setupScreenBackgroundColor() {
        super.setupScreenBackgroundColor()
        screenView.backgroundColor = .yellow
    }
}

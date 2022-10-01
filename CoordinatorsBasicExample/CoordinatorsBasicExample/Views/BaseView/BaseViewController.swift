//
//  BaseViewController.swift
//  CoordinatorsBasicExample
//
//  Created by M2Y on 01/10/22.
//

import UIKit
import RxSwift
import RxGesture

class BaseViewController: UIViewController {
    
    //MARK: - Variables
    public let screenView = BaseView()
    public var disposeBag = DisposeBag()

    //MARK: - Life cycle functions
    override func loadView() {
        self.view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupScreenLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupObservables()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }
    
    //MARK: - Functions
    private func setupScreenLayout() {
        setupNavBarTitle()
        setupAboveButtonLabel()
        setupScreenBackgroundColor()
    }
    
    public func setupScreenBackgroundColor() {
        screenView.backgroundColor = .white
    }
    
    public func setupNavBarTitle() {
        title = "Base View"
    }
    
    public func setupAboveButtonLabel() {
        screenView.aboveButtonLabel.text = "Base View Button"
    }
    
    private func setupObservables() {
        screenView.nextButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] (_) in
                self?.setupNextButtonAction()
            }).disposed(by: disposeBag)
    }
    
    public func setupNextButtonAction() {}
}

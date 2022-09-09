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
class SecondViewController: UIViewController {
    
    //MARK: - Variables
    weak var delegate: SecondViewControllerDelegate?
    private let screenView = SecondView()
    private var disposeBag = DisposeBag()

    //MARK: - Life cycle functions
    override func loadView() {
        self.view = screenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second View"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupObservables()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disposeBag = DisposeBag()
    }
    
    //MARK: - Init
    convenience init(delegate: SecondViewControllerDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    //MARK: - Setup Functions
    private func setupObservables() {
        screenView.nextButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] (_) in
                self?.delegate?.didTapNext()
            }).disposed(by: disposeBag)
    }
}


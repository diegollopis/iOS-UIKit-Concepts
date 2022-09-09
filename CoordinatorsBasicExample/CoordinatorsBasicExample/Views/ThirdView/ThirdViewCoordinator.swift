//
//  ThirdViewCoordinator.swift
//  CoordinatorsBasicExample
//
//  Created by Diego Llopis on 08/09/22.
//

import UIKit

public class ThirdViewCoordinator: Coordinator {
    
    //MARK: - Variables
    public let presenter: UINavigationController
    
    //MARK: - Init
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    //MARK: - Functions
    public func start() {
        let viewController = ThirdViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
}

//MARK: - FirstViewCoordinator Extension
extension ThirdViewCoordinator: ThirdViewControllerDelegate {
    
    func didTapNext() {
        presenter.popToRootViewController(animated: true)
    }
}

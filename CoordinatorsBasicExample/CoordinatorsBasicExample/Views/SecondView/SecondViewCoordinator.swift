//
//  SecondViewCoordinator.swift
//  CoordinatorsBasicExample
//
//  Created by Diego Llopis on 08/09/22.
//

import Foundation
import UIKit

public class SecondViewCoordinator: Coordinator {
    
    //MARK: - Variables
    public let presenter: UINavigationController
    private var coordinator: ThirdViewCoordinator?
    
    //MARK: - Init
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    //MARK: - Functions
    public func start() {
        let viewController = SecondViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
}

//MARK: - FirstViewCoordinator Extension
extension SecondViewCoordinator: SecondViewControllerDelegate {
    
    func didTapNext() {
        let coordinator = ThirdViewCoordinator(presenter: presenter)
        coordinator.start()
        self.coordinator = coordinator
    }
}


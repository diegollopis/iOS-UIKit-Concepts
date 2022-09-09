//
//  FirstViewCoordinator.swift
//
//  Created by Diego Llopis on 28/08/22.
//

import Foundation
import UIKit

public class FirstViewCoordinator: Coordinator {
    
    //MARK: - Variables
    public let presenter: UINavigationController
    private var coordinator: SecondViewCoordinator?
    
    //MARK: - Init
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    //MARK: - Functions
    public func start() {
        let viewController = FirstViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
}

//MARK: - FirstViewCoordinator Extension
extension FirstViewCoordinator: FirstViewControllerDelegate {
    
    func didTapNext() {
        let coordinator = SecondViewCoordinator(presenter: presenter)
        coordinator.start()
        self.coordinator = coordinator
    }
}

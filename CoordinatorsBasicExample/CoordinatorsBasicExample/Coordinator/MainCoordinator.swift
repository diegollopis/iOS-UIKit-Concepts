//
//  MainCoordinator.swift
//  bankey-app-rxswift
//
//  Created by Diego Llopis on 28/08/22.
//

import Foundation
import UIKit

public class MainCoordinator: Coordinator {
    
    //MARK: - Variables
    public var window: UIWindow
    public var presenter: UINavigationController
    private var coordinator: FirstViewCoordinator?
    
    //MARK: - Init
    init(window: UIWindow, presenter: UINavigationController) {
        self.window = window
        self.presenter = presenter
        self.window.rootViewController = presenter
    }
    
    //MARK: - Functions
    public func start() {
        let coordinator = FirstViewCoordinator(presenter: presenter)
        coordinator.start()
        self.coordinator = coordinator
    }
}

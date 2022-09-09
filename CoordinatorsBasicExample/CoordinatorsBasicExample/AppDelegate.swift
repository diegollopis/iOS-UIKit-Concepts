//
//  AppDelegate.swift
//  CoordinatorsBasicExample
//
//  Created by M2Y on 06/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let presenter = UINavigationController()
        self.window?.rootViewController = presenter
        
        let coordinator = MainCoordinator(window: window!, presenter: presenter)
        coordinator.start()
        self.coordinator = coordinator
        
        return true
    }
}


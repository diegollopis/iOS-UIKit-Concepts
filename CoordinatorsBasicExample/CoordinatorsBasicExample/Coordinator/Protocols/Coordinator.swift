//
//  Coordinator.swift
//  bankey-app-rxswift
//
//  Created by Diego Llopis on 28/08/22.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    
    //MARK: - Variables
    var presenter: UINavigationController { get }
    
    //MARK: - Functions
    func start()
}

//
//  BottomModalViewController.swift
//  BottomModalViewExample
//
//  Created by Mobile2you on 31/12/21.
//

import UIKit

class BottomModalViewController: UIViewController {
    
    let defaultHeight: CGFloat = 300
    let dismissibleHeight: CGFloat = 200
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    var currentContainerHeight: CGFloat = 300
        
    lazy var bottomModalView: BottomModalView = {
        let bottomModal = BottomModalView()
        return bottomModal
    }()
    
    override func loadView() {
        super.loadView()
        view = bottomModalView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapGestureOnDismiss()
        setupPanGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePresentContainer()
    }
    
    func animatePresentContainer() {
        UIView.animate(withDuration: 0.3) {
            self.bottomModalView.containerViewBottomConstraint?.update(inset: 0)
            self.view.layoutIfNeeded()
        }
    }
    
    func setupTapGestureOnDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCloseAction))
        bottomModalView.dimmedView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleCloseAction() {
        animateDismissView()
    }
    
    func animateDismissView() {
        UIView.animate(withDuration: 0.3) {
            self.bottomModalView.containerViewBottomConstraint?.update(offset: self.bottomModalView.defaultHeight)
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.4) {
            self.bottomModalView.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
    }
    
    func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        print("Pan gesture y offset: \(translation.y)")
        
        let isDraggingDown = translation.y > 0
        print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
        
        let newHeight = currentContainerHeight + (-translation.y)
        
        switch gesture.state {
            case .changed:
                // This state will occur when user is dragging
                if newHeight < maximumContainerHeight {
                    // Keep updating the height constraint
                    self.bottomModalView.containerViewHeightConstraint?.update(offset: newHeight)
                    // refresh layout
                    view.layoutIfNeeded()
                }
            case .ended:
                // This happens when user stop drag,
                // so we will get the last height of container
                // Condition 1: If new height is below min, dismiss controller
                if newHeight < dismissibleHeight {
                    self.animateDismissView()
                }
                else if newHeight < defaultHeight {
                    // Condition 2: If new height is below default, animate back to default
                    animateContainerHeight(defaultHeight)
                }
                else if newHeight < maximumContainerHeight && isDraggingDown {
                    // Condition 3: If new height is below max and going down, set to default height
                    animateContainerHeight(defaultHeight)
                }
                else if newHeight > defaultHeight && !isDraggingDown {
                    // Condition 4: If new height is below max and going up, set to max height at top
                    animateContainerHeight(maximumContainerHeight)
                }
            default:
                break
            }
        
        func animateContainerHeight(_ height: CGFloat) {
            UIView.animate(withDuration: 0.4) {
                // Update container height
                self.bottomModalView.containerViewHeightConstraint?.update(offset: height)
                // Call this to trigger refresh constraint
                self.view.layoutIfNeeded()
            }
            // Save current height
            currentContainerHeight = height
        }
    }
}

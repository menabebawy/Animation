//
//  HomeModuleViewController.swift
//  HomeModule
//
//  Created by MacBook on 12/31/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit
import Utils

public protocol HomeModuleViewControllerDelegate: class {
    func homeModuleViewControllerDismiss(_ controller: HomeModuleViewController)
}

public final class HomeModuleViewController: UIViewController {
    let gradient = CAGradientLayer()

    var viewToPresenterProtocol: HomeModuleViewToPresenter!
    public weak var delegate: HomeModuleViewControllerDelegate?

    override public func viewDidLoad() {
        super.viewDidLoad()
        viewToPresenterProtocol.viewIsReady()
    }
    
    @objc private func logoutButtonClicked() {
        delegate?.homeModuleViewControllerDismiss(self)
    }

}

// MARK: - Home module presenter to view

extension HomeModuleViewController: HomeModulePresenterToView {
    func addTitle() {
        title = "Home"
    }

    func addNavigationBarImage() {
        if let navigationBar = navigationController?.navigationBar {
            var bounds = navigationBar.bounds
            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
            gradient.frame = bounds
            gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            gradient.opacity = 0.8
            
            if let image = UIImage.getFrom(gradientLayer: gradient) {
                navigationBar.setBackgroundImage(image, for: .default)
            }
        }
    }
    
    func addLogoutItemButton() {
        let logoutButtonItem = UIBarButtonItem.init(
            barButtonSystemItem: .undo,
            target: self,
            action: #selector(logoutButtonClicked))
        navigationItem.leftBarButtonItem = logoutButtonItem
    }
    
    func moveGradient(gravityX: Double, gravityY: Double) {
        // Couldn't be tested due to cell phone OS version
        let animation = CABasicAnimation()
        animation.fromValue = [0.4, 0]
        animation.toValue = [0.6, 0]
        animation.autoreverses = false
        gradient.add(animation, forKey: nil)
    }
    
}

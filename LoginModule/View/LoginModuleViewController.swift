//
//  LoginModuleViewController.swift
//  LoginModule
//
//  Created by MacBook on 12/30/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit
import Utils

public protocol LoginModuleViewControllerDelegate: class {
    func loginModuleViewControllerLoggedIn(_ controller: LoginModuleViewController)
}

public final class LoginModuleViewController: UIViewController {
    @IBOutlet weak private var cloud1ImageView: UIImageView!
    @IBOutlet weak private var cloud2ImageView: UIImageView!
    @IBOutlet weak private var cloud3ImageView: UIImageView!
    @IBOutlet weak private var cloud4ImageView: UIImageView!
    @IBOutlet weak private var headerLabel: UILabel!
    @IBOutlet weak private var headerLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak private var loginButton: UIButton!
    @IBOutlet weak private var loginButtonCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var passwordTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak private var usernameTextField: UITextField!
    @IBOutlet weak private var usernameTextFieldCenterConstraint: NSLayoutConstraint!
    
    private var orderedViewsCenterConstraint: [NSLayoutConstraint] {
        return [headerLabelCenterConstraint,
                usernameTextFieldCenterConstraint,
                passwordTextFieldCenterConstraint,
                loginButtonCenterConstraint]
    }
    
    var viewToPresenterProtocol: LoginModuleViewToPresenter!
    weak var delegate: LoginModuleViewControllerDelegate?
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewToPresenterProtocol.willPrepareViews()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewToPresenterProtocol.willAnimateViews()
    }
    
    @IBAction private func login() {
        viewToPresenterProtocol.didTapLoginButton(username: usernameTextField.text,
                                                  password: passwordTextField.text)
    }
    
}

// MARK: - Login module presenter to view

extension LoginModuleViewController: LoginModulePresenterToView {
    func prepareViews() {
        orderedViewsCenterConstraint.forEach { $0.constant -= view.bounds.width }
    }
    
    func animateViews() {
        headerLabelCenterConstraint.constant = 0
        animate(updateLayout, duration: 0.5)
        
        usernameTextFieldCenterConstraint.constant = 0
        animate(updateLayout, duration: 0.5, delay: 0.3)
        
        passwordTextFieldCenterConstraint.constant = 0
        animate(updateLayout, duration: 0.5, delay: 0.4)
        
        loginButtonCenterConstraint.constant = 0
        animate(updateLayout, duration: 0.5, delay: 0.4)
        
        animateClouds()
    }
    
    private func updateLayout() {
        view.layoutIfNeeded()
    }

    private func animateClouds() {
        let options: UIView.AnimationOptions = [.curveEaseInOut, .repeat, .autoreverse]
        animate(updateCloud1ImageView, duration: 2.9, options: options)
        animate(updateCloud2ImageView, duration: 3.0, delay: 0.2, options: options)
        animate(updateCloud3ImageView, duration: 2.4, delay: 0.1, options: options)
        animate(updateCloud4ImageView, duration: 3.2, delay: 0.5, options: options)
    }
    
    private func updateCloud1ImageView() {
        updateImageView(cloud1ImageView, bySize: CGSize.square(1.18))
    }
    
    private func updateCloud2ImageView() {
        updateImageView(cloud2ImageView, bySize: CGSize.square(1.28))
    }
    
    private func updateCloud3ImageView() {
        updateImageView(cloud3ImageView, bySize: CGSize.square(1.15))
    }
    
    private func updateCloud4ImageView() {
        updateImageView(cloud4ImageView, bySize: CGSize.square(1.23))
    }
    
    private func updateImageView(_ imageView: UIImageView, bySize size: CGSize) {
        imageView.height *= size.height
        imageView.width *= size.width
    }

    
    func faileToLoginDueToWrongCredentials() {
        loginButton.shake(margin: 10, duration: 0.7)
        view.endEditing(true)
    }
    
    func loggedInSuccessfully() {
    }
    
}

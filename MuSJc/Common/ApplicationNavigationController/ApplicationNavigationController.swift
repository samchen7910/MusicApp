//
//  ApplicationNavigationController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

/// An application navigation controller that should always be used whenever
/// there is a need for a navigation controller.
class ApplicationNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Privates
private extension ApplicationNavigationController {

    func setup() {
		navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18) as Any]
		navigationBar.barTintColor = .darkGray
        navigationBar.backIndicatorImage = #imageLiteral(resourceName: "ic_back")
        navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "ic_back")
        navigationBar.tintColor = .white
//        UIBarButtonItem.appearance().setTitleTextAttributes(
//            [.font: UIFont.sfUIDisplayBold(ofSize: 16) as Any, .foregroundColor: UIColor.myLikiesDarkRed],
//            for: .normal)
//        UIBarButtonItem.appearance().setTitleTextAttributes(
//            [.font: UIFont.sfUIDisplayBold(ofSize: 16) as Any, .foregroundColor: UIColor.myLikiesDarkRed],
//            for: .highlighted)
//        UIBarButtonItem.appearance().setTitleTextAttributes(
//            [.font: UIFont.sfUIDisplayBold(ofSize: 16) as Any, .foregroundColor: UIColor.myLikiesDarkRed],
//            for: .selected)
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        // https://stackoverflow.com/a/46152420
        navigationBar.setValue(true, forKey: "hidesShadow")
        // Enable pop gesture without navigation barbtw
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
        view.backgroundColor = .white
        delegate = self
    }
}

extension ApplicationNavigationController: UINavigationControllerDelegate {

    func navigationController(
        _ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}

// MARK: - Navigation Controller Delegate
extension ApplicationNavigationController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool { true }
}

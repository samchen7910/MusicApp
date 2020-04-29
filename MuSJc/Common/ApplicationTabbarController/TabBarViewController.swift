//
//  TabBarViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/28/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol TabBarViewControllerProtocol: class {
	func displayTabBar(_ items: [TabBarItemViewModel])
	func displayAccount()
	func displayHome()
	func displayLibrary()
	func displaySearch()
}

class TabBarViewController: UITabBarController {

	private var interactor: TabBarInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
		title = ""
		delegate = self
	}

	func prepare() {
		tabBar.unselectedItemTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
		UITabBarItem.appearance().setTitleTextAttributes(
			[.font: UIFont.systemFont(ofSize: 12) as Any], for: .normal)
		tabBar.barTintColor = .white
		tabBar.isTranslucent = false
		if #available(iOS 13, *) {
			let appearance = tabBar.standardAppearance.copy()
			appearance.backgroundColor = #colorLiteral(red: 0.1960526407, green: 0.1960932612, blue: 0.1960500479, alpha: 1)
			appearance.shadowImage = UIImage()
			appearance.shadowColor = #colorLiteral(red: 0.1960526407, green: 0.1960932612, blue: 0.1960500479, alpha: 1)
			tabBar.standardAppearance = appearance
		} else {
			tabBar.barTintColor = #colorLiteral(red: 0.1960526407, green: 0.1960932612, blue: 0.1960500479, alpha: 1)
			tabBar.isTranslucent = false
			tabBar.shadowImage = UIImage()
			tabBar.backgroundImage = UIImage()
		}
		
		interactor?.handleViewDidLoad()

	}

	func set(interactor: TabBarInteractorProtocol?) {
		self.interactor = interactor
	}
	

	
	
}

extension TabBarViewController: TabBarViewControllerProtocol, UITabBarControllerDelegate {
	
	func displayTabBar(_ items: [TabBarItemViewModel]) {
		viewControllers = items.map {
			let viewController = $0.viewController ?? UIViewController()
			let tabBarItem = UITabBarItem(title: $0.title, image: $0.icon, tag: $0.tag)
			viewController.tabBarItem = tabBarItem
			return viewController
		}
//		tabBar.items?[0].title = items[0].title
	}
	
	func displaySearch() {
//		tabBar.items?.forEach { $0.title = nil }
//		selectedIndex = 3
//		if let selectedItem = tabBar.selectedItem {
//			selectedItem.title = interactor?.items[selectedItem.tag].title
//		}
	}

    func displayLibrary() {
//        tabBar.items?.forEach { $0.title = nil }
//        selectedIndex = 2
//        if let selectedItem = tabBar.selectedItem {
//            selectedItem.title = interactor?.items[selectedItem.tag].title
//        }
    }
	
	func displayAccount() {
		
	}
    
    func displayHome() {
//        tabBar.items?.forEach { $0.title = nil }
//        selectedIndex = 0
//        if let selectedItem = tabBar.selectedItem {
//                  selectedItem.title = interactor?.items[selectedItem.tag].title
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//			guard let trainingNavigationController = self.selectedViewController as?
//				TrainingNavigationController else { return }
//            trainingNavigationController.displayPeriods()
//        }
    }
}

// MARK: - Animations
extension TabBarViewController {
	
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//		tabBar.items?.forEach { $0.title = nil }
//		item.title = interactor?.items[item.tag].title
	}
}


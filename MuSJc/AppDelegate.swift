//
//  AppDelegate.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	private lazy var app = MuSJcApp()
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		if !isRunningUnitTests {
			window = UIWindow(frame: UIScreen.main.bounds)
			window?.makeKeyAndVisible()
			app.prepare()
		}
		return true
	}

}

// MARK: - Global Properties
// This global variable used to determine if the app is running tests.
var isRunningUnitTests: Bool {
	let environment = ProcessInfo.processInfo.environment
	if environment["APP_IS_RUNNING_TEST"] == "YES" {
		return true
	} else { return false }
}

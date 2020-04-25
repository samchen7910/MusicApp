//
//  ErrorHandler.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol ErrorHandlerProtocol {
	func handle(_ error: Error)
}

class ErrorHandler: ErrorHandlerProtocol {
	
	private let alertPresenter: AlertPresenterProtocol
	
	init(alertPresenter: AlertPresenterProtocol) {
		self.alertPresenter = alertPresenter
	}
	
	func handle(_ error: Error) {
		guard let appError = error as? AppError else {
			print(error.localizedDescription)
			return
		}
		
		let confirmAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertPresenter.presentAlert(title: appError.title, description: appError.description, actions: [confirmAction])
	}
}

protocol AppError: Error {
	var title: String { get }
	var description: String { get }
}

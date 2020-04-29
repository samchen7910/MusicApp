//
//  ApplicationFirebaseProtocol.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import Firebase

//sourcery: AutoMockable
protocol ApplicationFirebaseProtocol {
	
	func prepare()
}

class ApplicationFirebase: ApplicationFirebaseProtocol {
	
	func prepare() {
//		FirebaseApp.configure()
	}
}

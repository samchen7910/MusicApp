//
//  SongListDataSource.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 5/6/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

class SongListDataSource: NSObject, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 8
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		<#code#>
	}
}

//
//  SongDetailViewController.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol SongDetailViewControllerProtocol: class, UIViewControllerRouting {
	
}

class SongDetailViewController: UIViewController {
	@IBOutlet weak var playerView: PlayerCustomView!
	@IBOutlet weak var playButton: UIButton! {
		didSet {
			playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .yellow
	}
	

	
	@objc func playButtonTapped() {
		playerView.needleTapped()
	}
}

extension SongDetailViewController: SongDetailViewControllerProtocol {
	
}


//
//  PlayerCustomView.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 4/25/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

class PlayerCustomView: UIView, CustomViewProtocol {
	
	// MARK: - Outlet
	@IBOutlet var contentView: UIView!
	@IBOutlet weak var needleContainerView: UIView!
	@IBOutlet weak var needleView: UIView! {
		didSet {
			needleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(needleTapped)))
		}
	}
	@IBOutlet weak var discImageView: UIImageView!
	@IBOutlet weak var previousButton: UIButton! {
		   didSet {
			   previousButton.addTarget(self, action: #selector(previousSong), for: .touchUpInside)
		   }
	   }
	@IBOutlet weak var nextButton: UIButton! {
		didSet {
			nextButton.addTarget(self, action: #selector(nextSong), for: .touchUpInside)
		}
	}
	@IBOutlet weak var audioSliderView: AudioPlayerSlider!
	// MARK: - Private
	private var isPlaying = false
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit(for: "PlayerCustomView")
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit(for: "PlayerCustomView")
	}
	
	@objc func needleTapped() {
		isPlaying.toggle()
		if isPlaying {
			UIView.animate(withDuration: 0.5, animations: {
				self.needleContainerView.transform = CGAffineTransform(rotationAngle: .pi/4)
			}) { _ in
				self.discImageView.rotate()
			}
		} else {
			UIView.animate(withDuration: 0.5, animations: {
				self.needleContainerView.transform = .identity
			}) { _ in
				self.discImageView.layer.removeAnimation(forKey: "rotationAnimation")
			}
		}
	}
	
	@objc func nextSong() {
		audioSliderView.value += 0.15
	}
	
	@objc func previousSong() {
		audioSliderView.value -= 0.15
	}
}

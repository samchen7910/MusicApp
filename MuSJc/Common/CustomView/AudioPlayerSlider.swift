//
//  AudioPlayerSlider.swift
//  MuSJc
//
//  Created by Tran Gia Huy on 5/3/20.
//  Copyright © 2020 Tran Gia Huy. All rights reserved.
//

import UIKit

class AudioPlayerSlider: UISlider {
	
	var sliderThumbImage: UIImage? {
		didSet { setUp() }
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setUp()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUp()
	}
	
	override func trackRect(forBounds bounds: CGRect) -> CGRect {
		return CGRect(
			x: 0,
			y: bounds.height/2 - 3,
			width: bounds.width,
			height: 7)
	}
	
	private func setUp() {
		do {
			setMinimumTrackImage(UIImage(named: "backImage")?.resizableImage(withCapInsets:  UIEdgeInsets.init(top: 0, left: trackRect(forBounds: bounds).size.height, bottom: 0, right: trackRect(forBounds: bounds).size.height)) ,for: .normal)
			setThumbImage(UIImage(), for: .normal)
		} catch {
			assertionFailure("Unable to draw gradient Image.")
		}
	}
	
	private func gradientImage(size: CGSize, colorSet: [CGColor]) throws -> UIImage? {
		let tgl = CAGradientLayer()
		tgl.frame = .init(x: 0, y: 0, width: size.width, height: size.height)
		tgl.cornerRadius = tgl.frame.height / 2
		tgl.masksToBounds = false
		tgl.colors = colorSet
		tgl.startPoint = CGPoint.init(x: 0.0, y: 0.5)
		tgl.endPoint = CGPoint.init(x: 1.0, y: 0.5)
		UIGraphicsBeginImageContextWithOptions(size, tgl.isOpaque, 0.0)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		tgl.render(in: context)
		let image = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(
			withCapInsets: UIEdgeInsets.init(top: 0, left: size.height, bottom: 0, right: size.height))
		UIGraphicsEndImageContext()
		return image
	}
	
	
	
	private func gradientImage(size: CGSize, color: CGColor) throws -> UIImage? {
		let tgl = CAGradientLayer()
		tgl.frame = .init(x: 0, y: 0, width: size.width, height: size.height)
		tgl.cornerRadius = tgl.frame.height / 2
		tgl.masksToBounds = false
		tgl.colors = [color]
//		tgl.startPoint = CGPoint.init(x: 0.0, y: 0.5)
//		tgl.endPoint = CGPoint.init(x: 1.0, y: 0.5)
		UIGraphicsBeginImageContextWithOptions(size, tgl.isOpaque, 0.0)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		tgl.render(in: context)
		let image = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(
			withCapInsets: UIEdgeInsets.init(top: 0, left: size.height, bottom: 0, right: size.height))
		UIGraphicsEndImageContext()
		return image
	}
	
}

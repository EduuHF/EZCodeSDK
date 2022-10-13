//
//  LoadingView.swift
//  iPokemon
//
//  Created by Edu on 05/08/22.
//

import Foundation
import UIKit
import Lottie
import NVActivityIndicatorView

class LoadingView: UIView {

    // MARK: - Properties and Vars -
    private let animView = AnimationView()
    private var nameList = [
        "PokeLoading",
        "PokeLoading2",
        "PokeLoading3",
        "PokeLoading4",
        "PokeLoading5",
    ]

    // MARK: - Lifecycle Methods -
    public init(frame: CGRect,
                animName: String = "") {
        super.init(frame: frame)
        self.setupUI(animName: animName)
    }

    public init(frame: CGRect,
                loadingType: NVActivityIndicatorType,
                color: UIColor) {
        super.init(frame: frame)

        self.setupUI(loadingType: loadingType,
                     color: color)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods -
    private func setupUI(animName: String) {

        self.backgroundColor = .black.withAlphaComponent(0.6)
        let anim = Animation.named(animName)
        self.animView.animation = anim
        self.animView.frame =  CGRect(origin: self.frame.origin,
                                      size: CGSize(width: 150, height: 150))
        self.animView.center = self.center
        self.animView.contentMode = .scaleAspectFit
        self.animView.loopMode = .loop
        self.tag = EZKeys.LOADING_VIEW_TAG
        self.addSubview(self.animView)
        self.animView.play()
    }

    private func setupUI(loadingType: NVActivityIndicatorType,
                         color: UIColor) {

        let vWidth = UIScreen.main.bounds.width
        let loadingView = NVActivityIndicatorView(frame: CGRect(x: (vWidth / 2) - 50,
                                                                y: (vWidth / 2) - 150,
                                                                width: 100,
                                                                height: 100),
                                                  type: loadingType,
                                                  color: color,
                                                  padding: 0)
        loadingView.tag = EZKeys.LOADING_VIEW_TAG
        loadingView.startAnimating()
        self.addSubview(loadingView)
    }
}

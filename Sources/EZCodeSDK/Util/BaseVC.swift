//
//  BaseVC.swift
//  iPokemon
//
//  Created by Edu on 30/07/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

open class BaseVC: UIViewController {

    // MARK: - Lifecycle Methods
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.preSetupUI()
    }

    // MARK: - Private Methods -

    private func preSetupUI() {
        self.view.backgroundColor = .mainAppColor
    }

    public func setupNavBar(title: String,
                             colorTitle: UIColor? = .colorRed,
                             colorNav: UIColor? = .mainAppColor,
                             withBackBtn: Bool? = true,
                             withLargeTitles: Bool? = false) {

        self.navigationController?
            .navigationBar
            .barTintColor = colorNav
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?
            .navigationBar
            .prefersLargeTitles = withLargeTitles ?? false
        self.navigationItem.title = title
        self.navigationController?
            .navigationBar
            .titleTextAttributes = [.foregroundColor: colorTitle ?? .colorRed]
        self.navigationController?
            .navigationBar
            .largeTitleTextAttributes = [.foregroundColor: colorTitle ?? .colorRed]

        if withBackBtn ?? false { self.setupBackBtn() }
    }

    private func setupBackBtn(with color: UIColor? = .black) {

        var backIC = UIImage()
        if #available(iOS 13.0, *) {
            backIC = UIImage(systemName: "chevron.backward") ?? UIImage()
        }

        self.navigationItem
            .leftBarButtonItem = UIBarButtonItem(image: backIC,
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(onBack))
        self.navigationItem
            .leftBarButtonItem?
            .tintColor = color
    }

    public func showLoadingView(animName: String) {

        self.view
            .isUserInteractionEnabled = false
        let loadingView = LoadingView(frame: UIScreen.main.bounds,
                                      animName: animName)
        self.view.addSubview(loadingView)

    }

    public func showLoadingView(loadingType: NVActivityIndicatorType,
                                 color: UIColor) {

        self.view
            .isUserInteractionEnabled = false
        let loadingView = LoadingView(frame: UIScreen.main.bounds,
                                      loadingType: loadingType,
                                      color: color)
        self.view.addSubview(loadingView)

    }

    public func hideLoadingView() {

        self.view
            .isUserInteractionEnabled = true
        self.view.subviews.forEach { (view) in
            if view.tag == EZKeys.LOADING_VIEW_TAG {
                view.removeFromSuperview()
            }
        }
    }

    // MARK: - Action Methods -

    @objc func onBack() {
        self.navigationController?
            .popViewController(animated: true)
    }
}

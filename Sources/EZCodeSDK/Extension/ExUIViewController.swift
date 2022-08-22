//
//  ExUIViewController.swift
//  BAApp
//
//  Created by Edu on 19/05/22.
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: - Alert Build Methods
    private func buildAlert(title: NSAttributedString?,
                            msg: NSAttributedString?,
                            type: AlertKind) {

        let baseAlert = BaseAlert.init()
            .primaryAction(title: "OK")
            .buildSimpleAlert(title: title, msg: msg, type: type)
            .build

        present(baseAlert, animated: false)
    }

    private func buildAlert(title: NSAttributedString?,
                            msg: NSAttributedString?,
                            type: AlertKind,
                            action: (() -> Void)? = nil) {

        let baseAlert = BaseAlert.init()
            .primaryAction(title: "Ok", handler: action)
            .buildSimpleAlert(title: title, msg: msg, type: type)
            .build

        present(baseAlert, animated: false)
    }

    // MARK: - Alert Methods
    public func showAlertView(title: String?,
                   msg: String?,
                   type: AlertKind = .success,
                   action: @escaping (() -> Void)) {
        self.buildAlert(title: NSAttributedString(string: title ?? ""),
                        msg: NSAttributedString(string: msg ?? ""),
                        type: type,
                        action: action)
    }

    public func showAPIErrorView(title: String? = "",
                      msg: String?,
                      type: AlertKind = .attention,
                      action: (() -> Void)? = nil) {
        self.buildAlert(title: NSAttributedString(string: title ?? ""),
                        msg: NSAttributedString(string: msg ?? ""),
                        type: type,
                        action: action)
    }
}

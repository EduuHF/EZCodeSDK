//
//  BaseAlert.swift
//  BAApp
//
//  Created by Edu on 27/05/22.
//

import Foundation
import UIKit

public struct BaseAlert {

    public var mainAlert = BaseAlertVC()

    public init(title: String? = nil) {
        self.mainAlert
            .modalPresentationStyle = .overCurrentContext
    }

    public func buildSimpleAlert(title: NSAttributedString?,
                                 msg: NSAttributedString?,
                                 type: AlertKind) -> Self {
        self.mainAlert.buildSimpleAlert(title: title,
                                        msg: msg,
                                        alertType: type)
        return self
    }

    public func primaryAction(title: String,
                              bgColor: UIColor? = .colorBlue,
                              handler: (() -> Void)? = nil) -> Self {
        self.mainAlert.primaryAct = BaseAlertVC
            .Action
            .init(title: title,
                  backgroundColor: bgColor,
                  action: handler)

        return self
    }

    public var build: BaseAlertVC {
        mainAlert
    }
}

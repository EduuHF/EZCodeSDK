//
//  ExUITextField.swift
//  BAApp
//
//  Created by Edu on 19/05/22.
//

import Foundation
import UIKit

enum TFKind {
    case email, pass, phone, normal
}

extension UITextField {

    func validateFieldFor(kind: TFKind) -> Bool {

        var isValid: Bool = true
        switch kind {
        case .email:
            isValid = self.text != ""
        default:
            isValid = self.text != ""
        }

        return isValid
    }
}
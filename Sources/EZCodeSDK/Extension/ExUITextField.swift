//
//  ExUITextField.swift
//  BAApp
//
//  Created by Edu on 19/05/22.
//

import Foundation
import UIKit

public enum TFKind {
    case email, pass, phone, normal
}

extension UITextField {

    public func validateFieldFor(kind: TFKind) -> Bool {

        var isValid: Bool = true
        switch kind {
        case .email:
            isValid = self.isValid(regex: EZKeys.emailRegex)
        case .pass:
            isValid = self.isValid(regex: EZKeys.passRegex)
        case .phone:
            isValid = self.isValid(regex: EZKeys.phoneRegex)
        default:
            isValid = ((self.text?.isEmpty) != nil)
        }

        return isValid
    }

    private func isValid(regex: String?) -> Bool {

        guard let pRegex = regex else { return false }
        guard let text = self.text,
                !text.isEmpty else { return false }

        return NSPredicate(format: "SELF MATCHES %@",
                           pRegex).evaluate(with: text)
    }

}

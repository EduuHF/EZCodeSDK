//
//  ExString.swift
//  BAApp
//
//  Created by Edu on 30/05/22.
//

import Foundation
import UIKit

extension String {

    public func localized() -> String {
        return NSLocalizedString(self,
                                 comment: "")
    }

    public func textHeight(width: CGFloat = 300,
                    font: UIFont =
        .systemFont(ofSize: 15)) -> CGFloat {
        return self.height(withConstrainedWidth: width,
                           font: font)
    }

    public func height(withConstrainedWidth width:
                CGFloat,
                font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes:
                                                [NSAttributedString.Key.font: font],
                                            context: nil)

        return ceil(boundingBox.height)
    }

    public func width(withConstraintedHeight height: CGFloat,
               font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude,
                                    height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)

        return ceil(boundingBox.width)
    }
}

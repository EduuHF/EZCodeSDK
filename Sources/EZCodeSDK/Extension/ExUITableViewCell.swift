//
//  ExUITableViewCell.swift
//  BAApp
//
//  Created by Edu on 04/06/22.
//

import Foundation
import UIKit

extension UITableViewCell {

    public var parentVC: UIViewController? {
        return ((self.superview as? UITableView)?
            .delegate as? BaseVC)
    }

    public func makeCellAnimation(indexIn: Int) {

        if indexIn % 2 == 0 {
            self.contentView.animFromLeft()
        } else {
            self.contentView.animFromRight()
        }
    }

    @objc public func onCellWillAppear() {}
}

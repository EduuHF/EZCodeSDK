//
//  ExUITableViewCell.swift
//  BAApp
//
//  Created by Edu on 04/06/22.
//

import Foundation
import UIKit

extension UITableViewCell {

    var parentVC: UIViewController? {
        return ((self.superview as? UITableView)?
            .delegate as? BaseVC)
    }

    func makeCellAnimation(indexIn: Int) {

        if indexIn % 2 == 0 {
            self.contentView.animFromLeft()
        } else {
            self.contentView.animFromRight()
        }
    }

    @objc func onCellWillAppear() {}
}

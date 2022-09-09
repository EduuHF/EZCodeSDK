import Foundation
import UIKit

public protocol ViewInterface: AnyObject {
    func showLoading(animName: String)
    func showLoading(color: UIColor)
    func hideLoading()
    func showAlert(title: String?,
                   msg: String)
}

extension ViewInterface {
}

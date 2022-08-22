import Foundation
import UIKit
import NVActivityIndicatorView

public protocol ViewInterface: AnyObject {
    func showLoading(animName: String)
    func showLoading(loadingType: NVActivityIndicatorType,
                         color: UIColor)
    func hideLoading()
    func showAlert(title: String?,
                   msg: String)
}

extension ViewInterface {
}

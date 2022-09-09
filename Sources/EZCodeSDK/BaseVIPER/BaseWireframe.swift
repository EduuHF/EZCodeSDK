import UIKit

public protocol WireframeInterface: AnyObject {
}

public class BaseWireframe<ViewController> where
ViewController: UIViewController {

    private unowned var _viewController: ViewController
    
    // We need it in order to retain the view controller reference upon first access
    private var temporaryStoredViewController: ViewController?

    public init(viewController: ViewController) {
        temporaryStoredViewController = viewController
        _viewController = viewController
    }

}

extension BaseWireframe: WireframeInterface {

}

extension BaseWireframe {
    
    public var viewController: ViewController {
        defer { temporaryStoredViewController = nil }
        return _viewController
    }

    public var navigationController:
    UINavigationController? {
        return viewController
            .navigationController
    }

}

extension UIViewController {
    
    public func presentWireframe<ViewController>(_ wireframe: BaseWireframe<ViewController>,
                                          animated: Bool = true,
                                          completion: (() -> Void)? = nil) {
        present(wireframe.viewController,
                animated: animated,
                completion: completion)
    }

}

extension UINavigationController {
    
    public func pushWireframe<ViewController>(_ wireframe: BaseWireframe<ViewController>,
                                       animated: Bool = true) {
        pushViewController(wireframe.viewController,
                           animated: animated)
    }
    
    public func setRootWireframe<ViewController>(_ wireframe: BaseWireframe<ViewController>,
                                          animated: Bool = true) {
        setViewControllers([wireframe.viewController],
                           animated: animated)
    }

}

import UIKit

@objc protocol ProgressBarRoutingLogic {
    func dismissProgressView()
}

protocol ProgressBarDataPassing {
    var dataStore: ProgressBarDataStore? { get }
}

class ProgressBarRouter: NSObject, ProgressBarRoutingLogic, ProgressBarDataPassing {
    weak var viewController: ProgressBarViewController?
    var dataStore: ProgressBarDataStore?
  
   // MARK: Routing
    func dismissProgressView() {
        guard let clockType = self.dataStore?.clcokType else { return }
        self.viewController?.delegate.progressUpdate(updateClockInfo: clockType)
        self.viewController?.dismiss(animated: true, completion: nil)
  }
}

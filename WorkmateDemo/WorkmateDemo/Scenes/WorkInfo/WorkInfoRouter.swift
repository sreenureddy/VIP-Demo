import UIKit

@objc protocol WorkInfoRoutingLogic {
    func routeToProgressView(segue: UIStoryboardSegue?)
}

protocol WorkInfoDataPassing {
    var dataStore: WorkInfoDataStore? { get }
}

class WorkInfoRouter: NSObject, WorkInfoRoutingLogic, WorkInfoDataPassing {
    weak var viewController: WorkInfoViewController?
    var dataStore: WorkInfoDataStore?
    // MARK: Routing
    func routeToProgressView(segue: UIStoryboardSegue?) {
      if let segue = segue {
        let destinationVC = segue.destination as! ProgressBarViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ProgressBarViewController") as! ProgressBarViewController
        destinationVC.delegate = viewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
      }
    }
    func navigateToSomewhere(source: WorkInfoViewController, destination: ProgressBarViewController) {
        source.present(destination, animated: true, completion: nil)
    }
    func passDataToSomewhere(source: WorkInfoDataStore, destination: inout ProgressBarDataStore) {
        destination.clcokType = source.clockType
    }
}

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToWorkLocationView(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    func routeToWorkLocationView(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! WorkInfoViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "WorkInfoViewController") as! WorkInfoViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
            navigateToSomewhere(source: viewController!, destination: destinationVC)
        }
    }
    
    func navigateToSomewhere(source: LoginViewController, destination: WorkInfoViewController) {
        source.show(destination, sender: nil)
    }
  
    func passDataToSomewhere(source: LoginDataStore, destination: inout WorkInfoDataStore) {
       destination.token = source.authKey?.key
    }
}

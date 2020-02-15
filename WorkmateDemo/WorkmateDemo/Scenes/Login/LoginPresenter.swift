import UIKit

protocol LoginPresentationLogic {
    func presenUserLoginData(response: User.Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func presenUserLoginData(response: User.Login.Response) {
        let key = self.getTheAuthorizationKey(response: response)
        let viewModel = User.Login.ViewModel(key: key)
        viewController?.pushToWorkInformationView(viewModel: viewModel)
    }
    
    private func getTheAuthorizationKey(response: User.Login.Response) -> String {
        guard let authKey = response.authorizationKey.key else {
            return ""
        }
        return authKey
    }
    
    
}

import UIKit

protocol LoginBusinessLogic {
  func loginApiRequest(request: User.Login.Request)
}

protocol LoginDataStore {
    var authKey: LoginResponse? { get set }
    var staffRequestInfo: StaffRequestResponse? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var authKey: LoginResponse?
    var staffRequestInfo: StaffRequestResponse?

    func loginApiRequest(request: User.Login.Request) {
        worker = LoginWorker()
        worker?.getUserLoginDeatils(postParmas: request, completionHandler: { (loginResponse, message) in
            guard let response = loginResponse else {
                return
            }
            self.authKey = response
            let userLoginResponse = User.Login.Response(authorizationKey: response)
            self.presenter?.presenUserLoginData(response: userLoginResponse)
        })
    }
}

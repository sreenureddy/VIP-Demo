import UIKit

class LoginWorker {
    
    func getUserLoginDeatils(postParmas: User.Login.Request, completionHandler: @escaping (_ sucess: LoginResponse?, _ message: String?) -> Void) {
        let apiManager = APIManager()
        apiManager.userLoginRequest(postParams: postParmas) { (loginResponse, message) in
            completionHandler(loginResponse, message)
        }
    }
}

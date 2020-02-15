import Foundation
import Alamofire

class APIManager {
    
    func userLoginRequest(postParams: User.Login.Request, completionHandler: @escaping (_ sucess: LoginResponse?, _ message: String?) -> Void) {
        
        //let headers = ["Authorization": ""]
        let workmateApi = WorkmateAPI()
        let loginURL = workmateApi.loginAPI
        let params = [
            "username": postParams.userName ?? "",
            "password": postParams.password ?? ""
            ] as [String : Any]
        
        Alamofire.request(loginURL, method: .post, parameters: params).responseString  { response in
            do {
                if let responseData = response.data {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(LoginResponse.self, from: responseData)
                    completionHandler(responseModel, nil)
                } else if let errorMessage = response.value {
                    completionHandler(nil, errorMessage)
                }
            } catch {
                completionHandler(nil, "We are unable to process request")
            }
        }
    }
    
    func staffRequestInformation(postParams: Staff.Requestinformation.Request, completionHandler: @escaping (_ sucess: StaffRequestResponse?, _ message: String?) -> Void) {
        let workmateApi = WorkmateAPI()
        let loginURL = workmateApi.staffRequest
        guard let token = postParams.authorizationKey else { return }
        let headers: HTTPHeaders = [
            "Authorization": "token" + token
        ]
       
        Alamofire.request(loginURL, method: .get, headers: headers).responseString  { response in
            do {
                if let responseData = response.data {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(StaffRequestResponse.self, from: responseData)
                    completionHandler(responseModel, nil)
                } else if let errorMessage = response.value {
                    completionHandler(nil, errorMessage)
                }
            } catch {
                completionHandler(nil, "We are unable to process request")
            }
        }
    }
    
    func clockInRequest(postParams: Staff.Requestinformation.Request, completionHandler: @escaping (_ sucess: CheckIn?, _ message: String?) -> Void) {
        let workmateApi = WorkmateAPI()
        let loginURL = workmateApi.clockIn
        guard let token = postParams.authorizationKey else { return }
        let headers: HTTPHeaders = [
            "Authorization": "token" + token
        ]
        
        let params = [
            "latitude": postParams.latitude ?? "",
            "longitude": postParams.longitude ?? ""
            ] as [String : Any]
        
        Alamofire.request(loginURL, method: .post, parameters: params, headers: headers).responseString  { response in
            do {
                if let responseData = response.data {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(CheckIn.self, from: responseData)
                    completionHandler(responseModel, nil)
                } else if let errorMessage = response.value {
                    completionHandler(nil, errorMessage)
                }
            } catch {
                completionHandler(nil, "We are unable to process request")
            }
        }
    }
    
    func clockOutRequest(postParams: Staff.Requestinformation.Request, completionHandler: @escaping (_ sucess: CheckOut?, _ message: String?) -> Void) {
        let workmateApi = WorkmateAPI()
        let loginURL = workmateApi.clockOut
        guard let token = postParams.authorizationKey else { return }
        let headers: HTTPHeaders = [
            "Authorization": "token" + token
        ]
        
        let params = [
            "latitude": postParams.latitude ?? "",
            "longitude": postParams.longitude ?? ""
            ] as [String : Any]
        
        Alamofire.request(loginURL, method: .post,  parameters: params, headers: headers).responseString  { response in
            do {
                if let responseData = response.data {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(CheckOut.self, from: responseData)
                    completionHandler(responseModel, nil)
                } else if let errorMessage = response.value {
                    completionHandler(nil, errorMessage)
                }
            } catch {
                completionHandler(nil, "We are unable to process request")
            }
        }
    }

}

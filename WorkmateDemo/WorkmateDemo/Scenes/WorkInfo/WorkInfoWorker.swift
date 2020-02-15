
import UIKit

class WorkInfoWorker {
    func getStaffRequestInformation(postParmas: Staff.Requestinformation.Request, completionHandler: @escaping (_ response: StaffRequestResponse?, _ message: String?) -> Void) {
        let apiManager = APIManager()
        apiManager.staffRequestInformation(postParams: postParmas) { (response, message) in
            completionHandler(response, message)
        }
    }
    
    func clockIn(postParmas: Staff.Requestinformation.Request, completionHandler: @escaping (_ response: CheckIn?, _ message: String?) -> Void) {
        let apiManager = APIManager()
        apiManager.clockInRequest(postParams: postParmas) { (checkInResponse, message) in
            completionHandler(checkInResponse, message)
        }
    }
    
    func clockOut(postParmas: Staff.Requestinformation.Request, completionHandler: @escaping (_ response: CheckOut?, _ message: String?) -> Void) {
        let apiManager = APIManager()
        apiManager.clockOutRequest(postParams: postParmas) { (checkOutResponse, message) in
            completionHandler(checkOutResponse, message)
        }
    }
}

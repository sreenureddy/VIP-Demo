import UIKit

protocol WorkInfoBusinessLogic {
    func getStaffRequestInformation(request: Staff.Requestinformation.Request)
    func clockIn(request: Staff.Requestinformation.Request)
    func clockOut(request: Staff.Requestinformation.Request)
    func pushToProgressView(request: Staff.Requestinformation.ClockTypeRequest)
}

protocol WorkInfoDataStore {
    var token: String? { get set }
    var staffResponse: StaffRequestResponse? { get set }
    var checkInResponse: CheckIn? { get set }
    var checkOutResponse: CheckOut? { get set }
    var clockType: ClockInfo? { get set }
}

class WorkInfoInteractor: WorkInfoBusinessLogic, WorkInfoDataStore  {
    var token: String?
    var presenter: WorkInfoPresentationLogic?
    var worker: WorkInfoWorker?
    var staffResponse: StaffRequestResponse?
    var checkInResponse: CheckIn?
    var checkOutResponse: CheckOut?
    var clockType: ClockInfo?
  
    func getStaffRequestInformation(request: Staff.Requestinformation.Request) {
        worker = WorkInfoWorker()
        worker?.getStaffRequestInformation(postParmas: request, completionHandler: {(staffResponse, message) in
            guard let response = staffResponse else { return }
            self.staffResponse = response
            let staffReqResponse = Staff.Requestinformation.Response(staffRequest: response)
           self.presenter?.presentStaffRequestInfo(response: staffReqResponse)
        })
    }
    
    func clockIn(request: Staff.Requestinformation.Request) {
        worker = WorkInfoWorker()
        worker?.clockIn(postParmas: request, completionHandler: { (checkInResponse, message) in
            guard let response = checkInResponse else { return }
            self.checkInResponse = response
            let chekcInTime = Staff.Requestinformation.CheckInResponse(chcekIn: response)
            self.presenter?.presentCheckInTime(response: chekcInTime)
        })
    }
    
    func clockOut(request: Staff.Requestinformation.Request) {
        worker = WorkInfoWorker()
        worker?.clockOut(postParmas: request, completionHandler: { (checkOutResponse, message) in
            guard let response = checkOutResponse else { return }
            self.checkOutResponse = response
            let chekcOutTime = Staff.Requestinformation.CheckOutResponse(checkOut: response)
            self.presenter?.presentCheckOutTime(response: chekcOutTime)
        })
    }
    
    func pushToProgressView(request: Staff.Requestinformation.ClockTypeRequest) {
        guard let response = request.clockType else { return }
        self.clockType = response
        let clockResponse = Staff.Requestinformation.clockTypeViewModel(clockType: response)
        self.presenter?.presentClockType(response: clockResponse)
    }
    
}

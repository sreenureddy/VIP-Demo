import UIKit

protocol WorkInfoPresentationLogic {
    func presentStaffRequestInfo(response: Staff.Requestinformation.Response)
    func presentCheckInTime(response: Staff.Requestinformation.CheckInResponse)
    func presentCheckOutTime(response: Staff.Requestinformation.CheckOutResponse)
    func presentClockType(response: Staff.Requestinformation.clockTypeViewModel)
}

class WorkInfoPresenter: WorkInfoPresentationLogic {
    weak var viewController: WorkInfoDisplayLogic?
    
    func presentStaffRequestInfo(response: Staff.Requestinformation.Response) {
        let staffReqInfo = getStaffInfoFromResponse(response: response)
        let viewModel = Staff.Requestinformation.ViewModel(information: staffReqInfo)
        viewController?.displayStaffRequestedInformation(viewModel: viewModel)
    }
    
    func presentCheckInTime(response: Staff.Requestinformation.CheckInResponse) {
        let checkInTime = getCheckInTime(reponse: response)
        let viewModel = Staff.Requestinformation.checkInViewModel(checkIn: checkInTime)
        viewController?.displayCheckInTime(viewModel: viewModel)
    }
    func presentCheckOutTime(response: Staff.Requestinformation.CheckOutResponse) {
        let checkOutTime = getCheckOutTime(reponse: response)
        let viewModel = Staff.Requestinformation.checkOutViewModel(checkOut: checkOutTime)
        viewController?.displayCheckOutTime(viewModel: viewModel)
    }
    
    func getStaffInfoFromResponse(response: Staff.Requestinformation.Response) -> Staff.Requestinformation.ViewModel.StaffRequest {
        let amount = response.staffRequest.wage_amount ?? ""
        let formattedAmount = amount.formattedCurrencyBasedOnIDR(input: amount)
        let staffReqInformation = Staff.Requestinformation.ViewModel.StaffRequest(
            positionName: response.staffRequest.position?.name ?? "",
            clientName: response.staffRequest.client?.name ?? "",
            managerName: response.staffRequest.manager?.name ?? "",
            managerPhone: response.staffRequest.manager?.phone ?? "",
            wageAmount: formattedAmount ?? "",
            wageType: response.staffRequest.wage_type ?? "",
            location: response.staffRequest.location?.address?.street_1 ?? ""
        )
        return staffReqInformation
    }
    
    func getCheckInTime(reponse: Staff.Requestinformation.CheckInResponse) -> String {
        let time = self.getTimeFrom(dateString: reponse.chcekIn.clock_in_time ?? "")
        return time
    }
    
    func getCheckOutTime(reponse: Staff.Requestinformation.CheckOutResponse) -> String {
        let time = self.getTimeFrom(dateString: reponse.checkOut.timesheet?.clock_out_time ?? "")
        return time
    }
    
    func getTimeFrom(dateString: String) -> String {
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let currentDate = format.date(from: dateString) else { return "-"}
        format.dateFormat = "HH:mm a"
        format.amSymbol = "AM"
        format.pmSymbol = "PM"
        let time = format.string(from: currentDate)
        return time
    }
    
    func presentClockType(response: Staff.Requestinformation.clockTypeViewModel) {
        viewController?.presentTheLoadingView(viewModel: response)
    }
}

import UIKit

protocol ProgressBarBusinessLogic {
    func progressViewdata(request: ProgressBar.information.Request)
    func dismissPresentedVC(request: ProgressBar.information.Request)
}

protocol ProgressBarDataStore {
    var clcokType: ClockInfo? { get set }
    var clcokTypeStr: String? { get set}
    
  //var name: String { get set }
}

class ProgressBarInteractor: ProgressBarBusinessLogic, ProgressBarDataStore {
    var presenter: ProgressBarPresentationLogic?
    var worker: ProgressBarWorker?
    var clcokType: ClockInfo?
    var clcokTypeStr: String?
    func progressViewdata(request: ProgressBar.information.Request) {
        var type = String()
        guard let clockType = request.clockType else { return }
        switch clockType {
        case .clock_in:
            type = "Clocking In..."
        case .clock_out:
            type = "Clocking Out..."
        default:
            type = "None"
        }
        let response = ProgressBar.information.ViewModel(checkType: type)
        presenter?.presentProgressViewInformation(response: response)
    }
    
    func dismissPresentedVC(request: ProgressBar.information.Request) {
        self.presenter?.dismissPresentedVC(viewModel: request)
    }
}

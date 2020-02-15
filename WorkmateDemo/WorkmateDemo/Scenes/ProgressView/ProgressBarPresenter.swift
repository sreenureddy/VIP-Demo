import UIKit

protocol ProgressBarPresentationLogic {
    func presentProgressViewInformation(response: ProgressBar.information.ViewModel)
    func dismissPresentedVC(viewModel: ProgressBar.information.Request)
}

class ProgressBarPresenter: ProgressBarPresentationLogic {
    weak var viewController: ProgressBarDisplayLogic?
    func presentProgressViewInformation(response: ProgressBar.information.ViewModel) {
        viewController?.displayProgressViewInformation(viewModel: response)
    }
    func dismissPresentedVC(viewModel: ProgressBar.information.Request) {
        self.viewController?.dismissPresentedVC(viewModel: viewModel)
    }
}

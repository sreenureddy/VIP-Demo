import UIKit

enum ClockInfo: String {
    case clock_in
    case clock_out
    case cancel
}

protocol ProgressBarDisplayLogic: class {
    func displayProgressViewInformation(viewModel: ProgressBar.information.ViewModel)
    func dismissPresentedVC(viewModel: ProgressBar.information.Request)
}

protocol ProgressBarProgressupdate: class {
    func progressUpdate(updateClockInfo: ClockInfo)
}

class ProgressBarViewController: UIViewController, ProgressBarDisplayLogic {

    /// IBOutlets
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var cancelBtn: UIButton!
    weak var delegate: ProgressBarProgressupdate!
    /// Properties
    var interactor: ProgressBarBusinessLogic?
    var router: (NSObjectProtocol & ProgressBarRoutingLogic & ProgressBarDataPassing)?
    var progressBarTimer: Timer!
    var isRunning: Bool = false

    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = ProgressBarInteractor()
        let presenter = ProgressBarPresenter()
        let router = ProgressBarRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
  
    func updateData() {
        guard let clcokType = self.router?.dataStore?.clcokType else { return }
        var request = ProgressBar.information.Request()
        request.clockType = clcokType
        interactor?.progressViewdata(request: request)
    }
  
    func displayProgressViewInformation(viewModel: ProgressBar.information.ViewModel) {
        self.statusLbl.text = viewModel.checkType
        if isRunning {
            progressBarTimer.invalidate()
        } else {
            self.progressBar.progress = 0.0
            self.progressBar.progressTintColor = UIColor.blue
            self.progressBar.progressViewStyle = .default
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ProgressBarViewController.updateProgressView), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        var request = ProgressBar.information.Request()
        request.clockType = ClockInfo.cancel
        self.interactor?.dismissPresentedVC(request: request)
    }
    
    @objc func updateProgressView(){
        progressBar.progress += 0.1
        progressBar.setProgress(progressBar.progress, animated: true)
        if(progressBar.progress == 1.0) {
            progressBarTimer.invalidate()
            isRunning = false
            self.router?.dismissProgressView()
        }
    }
    func dismissPresentedVC(viewModel: ProgressBar.information.Request) {
        self.progressBarTimer.invalidate()
        isRunning = false
        self.router?.dismissProgressView()
        
    }
    
    
}

import UIKit

protocol WorkInfoDisplayLogic: class {
    func displayStaffRequestedInformation(viewModel: Staff.Requestinformation.ViewModel)
    func displayCheckInTime(viewModel: Staff.Requestinformation.checkInViewModel)
    func displayCheckOutTime(viewModel: Staff.Requestinformation.checkOutViewModel)
    func presentTheLoadingView(viewModel: Staff.Requestinformation.clockTypeViewModel)
}

class WorkInfoViewController: UIViewController {
  /// IBOutlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var managerLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var checkInLbl: UILabel!
    @IBOutlet weak var checkOutLbl: UILabel!
    @IBOutlet weak var timerBtn: UIButton!
    /// Properties
    var interactor: WorkInfoBusinessLogic?
    var router: (NSObjectProtocol & WorkInfoRoutingLogic & WorkInfoDataPassing)?
    var isCheckIn: Bool = false
    var isCheckOut: Bool = false
    
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
        let interactor = WorkInfoInteractor()
        let presenter = WorkInfoPresenter()
        let router = WorkInfoRouter()
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
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logButtonPressed))
        self.checkInLbl.text = "-"
        self.checkOutLbl.text = "-"
        self.setButtonCornerRadius()
        self.getStaffRequestInfo()
    }
    func setButtonCornerRadius() {
        self.timerBtn.backgroundColor = UIColor.white
        self.timerBtn.layer.cornerRadius = self.timerBtn.frame.height / 2
        self.timerBtn.layer.borderColor = UIColor.lightGray.cgColor
        self.timerBtn.layer.borderWidth = 5.0
        timerBtn.setTitle("Clock In", for: .normal)
    }
    @IBAction func pushLoadView(_ sender: Any) {
        self.lockTheTime()
    }
    
     @objc func logButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func lockTheTime() {
        let checkInTime = checkInLbl.text?.count ?? 0
        let checkOutTime = checkOutLbl.text?.count ?? 0
        var request = Staff.Requestinformation.ClockTypeRequest()
        if checkInTime <= 1 {
            request.clockType = .clock_in
        } else if checkOutTime <= 1 {
            request.clockType = .clock_out
        }
        self.interactor?.pushToProgressView(request: request)

    }
    func getStaffRequestInfo() {
        guard let token = self.router?.dataStore?.token, token.count > 0 else {
            return
        }
        var request = Staff.Requestinformation.Request()
        request.authorizationKey = token
        interactor?.getStaffRequestInformation(request: request)
    }
    
    func updateCheckIn()  {
        guard let token = self.router?.dataStore?.token, token.count > 0 else {
            return
        }
        var request = Staff.Requestinformation.Request()
        request.authorizationKey = token
        request.latitude = "6.2446691"
        request.longitude = "106.8779625"
        interactor?.clockIn(request: request)
    }
    
    func updateCheckOut()  {
        guard let token = self.router?.dataStore?.token, token.count > 0 else {
            return
        }
        var request = Staff.Requestinformation.Request()
        request.authorizationKey = token
        request.latitude = "6.2446691"
        request.longitude = "106.8779625"
        interactor?.clockOut(request: request)
    }
}

extension WorkInfoViewController: WorkInfoDisplayLogic {
    func displayStaffRequestedInformation(viewModel: Staff.Requestinformation.ViewModel) {
        nameLbl.text = viewModel.information.positionName
        companyNameLbl.text = viewModel.information.clientName
        amountLbl.text = viewModel.information.wageAmount
        dayLbl.text = viewModel.information.wageType
        managerLbl.text = viewModel.information.managerName
        phoneNumberLbl.text = viewModel.information.managerPhone
        locationLbl.text = viewModel.information.location
        self.loadViewIfNeeded()
        self.updateCheckIn()
    }
    
    func displayCheckInTime(viewModel: Staff.Requestinformation.checkInViewModel) {
        self.checkInLbl.text = viewModel.checkIn
        guard self.checkInLbl.text?.count ?? 0 > 1 else { return }
        timerBtn.setTitle("Clock out", for: .normal)
    }
    
    func displayCheckOutTime(viewModel: Staff.Requestinformation.checkOutViewModel) {
        self.checkOutLbl.text = viewModel.checkOut
    }
    
    func presentTheLoadingView(viewModel: Staff.Requestinformation.clockTypeViewModel) {
        self.router?.routeToProgressView(segue: nil)
    }
}

extension WorkInfoViewController: ProgressBarProgressupdate {
    func progressUpdate(updateClockInfo: ClockInfo) {
        switch updateClockInfo {
        case .clock_in:
            self.updateCheckIn()
        case .clock_out:
            self.updateCheckOut()
        case .cancel:
            break
            
        }
    }
}

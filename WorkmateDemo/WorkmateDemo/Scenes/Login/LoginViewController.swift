import UIKit

protocol LoginDisplayLogic: class {
  func pushToWorkInformationView(viewModel: User.Login.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    /// IBOulets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    /// Properties
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
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
        self.navigationItem.title = "Workmate"
        self.backgroundView.layer.cornerRadius = 5.0
        self.setButtonCornerRadius()
        self.userNameTxt.delegate = self
        self.passwordTxt.delegate = self
    }
    
    func setButtonCornerRadius() {
        self.logInBtn.backgroundColor = UIColor.white
        self.logInBtn.layer.cornerRadius = self.logInBtn.frame.height / 2
        self.logInBtn.layer.borderColor = UIColor.lightGray.cgColor
        self.logInBtn.layer.borderWidth = 2.0
    }
  
      func loginRequest() {
        guard let name = userNameTxt.text, let password = passwordTxt.text, name.count > 0, password.count > 0 else {
            return
        }
        var request = User.Login.Request()
        request.userName = name
        request.password = password
        interactor?.loginApiRequest(request: request)
    }
    
    func pushToWorkInformationView(viewModel: User.Login.ViewModel) {
        guard viewModel.key.count > 0 else { return }
        self.router?.routeToWorkLocationView(segue: nil)
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        self.loginRequest()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}

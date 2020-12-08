import UIKit

private let reuseIdentifier = "SettingsCell"

class ProfileViewController: UIViewController {
    var window: UIWindow?
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Helper Functions
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
    
    func configureUI() {
        configureTableView()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 155/255, green: 155/255, blue: 250/255, alpha: 1)
        
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return Options.allCases.count
        
        default: return 0
        }
    }
    func tableView(_ tableView: UITableView,viewForHeaderInSection section: Int)-> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255,green : 255/255, blue: 255/255, alpha: 1)
        
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize:16)
        title.textColor = .gray
        title.text = "Account settings"
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        //title.centerYAnctor.constraint(equalTo: view.centerYAnctor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        return view
        
    }
    
    
    private func tableView(_ tebleView: UITableView, heightForHeaderInSEction section: Int)->CGFloat{
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        
        let options = Options(rawValue: indexPath.row)
        cell.textLabel?.text = options?.description
        cell.sectionType = options
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell

        
            
        let options = Options(rawValue: indexPath.row)
        cell.textLabel?.text = options?.description
        cell.sectionType = options
        
        if ((cell.textLabel?.text!.caseInsensitiveCompare("Payments and payouts")) == .orderedSame ){
                   showPayments()
               }
        
        
    }
    
    private func showPayments(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = PaymentViewController()
    }
    
    
}

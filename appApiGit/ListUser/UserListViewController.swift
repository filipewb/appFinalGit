//
//  UserListViewController.swift
//  appApiGit
//
//  Created by ti on 17/05/23.
//

import UIKit
import Combine

protocol UserListViewControllerDelegate: AnyObject {
    func showUserDetail(_ user: User)
}

class UserListViewController: UIViewController {
    private var viewModel: UserViewViewProtocol
    private var users: [User] = []
    private var cancellables: Set<AnyCancellable> = []
    
    weak var delegate: UserListViewControllerDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Init
    init(viewModel: UserViewViewProtocol = UserViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        bind()
        
        viewModel.getUsers()
    }
    
    // MARK: - Private
    private func bind() {
        viewModel.errorMessage
            .sink { [weak self] message in
                guard let self else { return }
                showAlert(title: "Error", message: message)
            }
            .store(in: &cancellables)
        
        viewModel.users
            .sink { [weak self] users in
                guard let self else { return }
                self.users.append(contentsOf: users)
                self.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func goToDetailsUser(user: User) {
        delegate?.showUserDetail(user)
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        
        let user = users[indexPath.row]
        cell.configure(with: user)
        cell.selectionStyle = .none
        
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailsUser(user: users[indexPath.row])
    }
}

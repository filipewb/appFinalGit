//
//  DetailUserViewController.swift
//  appApiGit
//
//  Created by ti on 17/05/23.
//

import UIKit

class DetailUserViewController: UIViewController {
    let viewModel = DetailViewModel()
    var user = User(login: "", id: 0, avatarURL: "")
    private var repos: [Repo] {
        viewModel.repos
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.reuseIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        setupConstraints()
        
        tableView.dataSource = self
        
        bind()
        
        viewModel.getRepos(login: user.login)
    }
    
    private func bind() {
        viewModel.onUpdate = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupView() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 6),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -6),
        ])
    }
}

extension DetailUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reuseIdentifier, for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        
        let repo = repos[indexPath.row]
        cell.configure(with: repo)
        cell.selectionStyle = .none
        
        return cell
    }
}


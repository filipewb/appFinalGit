//
//  DetailTableViewCell.swift
//  appApiGit
//
//  Created by ti on 17/05/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    static let reuseIdentifier = "DetailCell"
    let stringNula: String? = nil
    
    lazy var titleNameRepo: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Nome do Repositório: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameRepo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Descrição: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionRepo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var languageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Linguagem utilizada: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var languageProjectRepo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupViews() {
        contentView.addSubview(titleNameRepo)
        contentView.addSubview(nameRepo)
        
        contentView.addSubview(descriptionTitleLabel)
        contentView.addSubview(descriptionRepo)
        
        contentView.addSubview(languageTitleLabel)
        contentView.addSubview(languageProjectRepo)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleNameRepo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleNameRepo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleNameRepo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            nameRepo.topAnchor.constraint(equalTo: titleNameRepo.bottomAnchor, constant: 2),
            nameRepo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameRepo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: nameRepo.bottomAnchor, constant: 8),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            descriptionRepo.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 2),
            descriptionRepo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionRepo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            languageTitleLabel.topAnchor.constraint(equalTo: descriptionRepo.bottomAnchor, constant: 8),
            languageTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            languageTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            languageProjectRepo.topAnchor.constraint(equalTo: languageTitleLabel.bottomAnchor, constant: 2),
            languageProjectRepo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            languageProjectRepo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            languageProjectRepo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func configure(with repos: Repo) {
        nameRepo.text = repos.name
        descriptionRepo.text = repos.description
        languageProjectRepo.text = repos.language
    }
}

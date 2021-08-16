//
//  RepositoryCell.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import UIKit
import Kingfisher

protocol userDetailsDelegate {
    func userDetailsDelegate(url: String)
}

class RepositoryCell: UITableViewCell {
    
    // MARK: Properties
    let ui = RepositoryCellUI()
    var delegate: userDetailsDelegate?

    // MARK: UITableviewCell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Set user image clickable
        contentView.isUserInteractionEnabled = true
        setUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: Func
    
    func setUI() {
        ui.addSubviews(to: self)
    }
    
    func set(repository: Repository) {
        ui.nameLabel.text = repository.name
        ui.authorLabel.text = repository.owner.login
        ui.descriptionLabel.text = repository.description
        ui.avatarImageButton.kf.setImage(with: URL(string: repository.owner.avatar_url), for: .normal)
        
        //        ui.avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToUserDetails)))
        
        ui.forksLabel.set(image: UIImage(named: GKey.fork), text: repository.forks.roundedWithAbbreviations.description)
        ui.watchersLabel.set(image: UIImage(named: GKey.watcher), text: repository.watchers.roundedWithAbbreviations.description)
        ui.issuesLabel.set(image: UIImage(named: GKey.issue), text: repository.open_issues.roundedWithAbbreviations.description)
    }
    
    
    @objc private func goToUserDetails(url: String) {
        print("aaaa")
        delegate?.userDetailsDelegate(url: url)
//        self.navigationController?.pushViewController(UserDetailsViewController(url: url), animated: true)
    }
    
}



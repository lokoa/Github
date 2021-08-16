//
//  RepositoryDetailsViewController.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import UIKit

// This controller is used to present repository details. You can find additional info:
// author, name, description etc.

class RepositoryDetailsViewController: UIViewController {
    
    private let viewModel: RepoDetailsViewModel
    private let ui = RepoDetailsViewControllerUI()
    
    // MARK: UIViewController lifecycle
    
    init(repository: Repository) {
        self.viewModel = RepoDetailsViewModel(repository: repository)
        super.init(nibName: nil, bundle: nil)
        setUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.cancelNetworkRequests()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUI() {
        ui.addSubviews(to: self.view)
        ui.avatarImageView.kf.setImage(with: URL(string: viewModel.repository.owner.avatar_url))
        ui.authorLabel.text = viewModel.repository.owner.login
        ui.languageLabel.text = viewModel.repository.language
        ui.nameLabel.text = viewModel.repository.name
        ui.descriptionLabel.text = viewModel.repository.description
        
        ui.detailsUrlLabel.set(image: UIImage(named: GKey.link), text: viewModel.repository.html_url)
        ui.starsLabel.set(image: UIImage(named: GKey.star), text: viewModel.repository.stargazers_count.roundedWithAbbreviations.description)
        ui.forksLabel.set(image: UIImage(named: GKey.fork), text: viewModel.repository.forks.roundedWithAbbreviations.description)
        ui.watchersLabel.set(image: UIImage(named: GKey.watcher), text: viewModel.repository.watchers.roundedWithAbbreviations.description)
        ui.issuesLabel.set(image: UIImage(named: GKey.issue), text: viewModel.repository.open_issues.roundedWithAbbreviations.description)
        
        // Open user details and external browser only if environment is set to production
        if BuildConfiguration.shared.environment == .debugProduction {
            ui.avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openUserDetails)))
            ui.detailsUrlLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToURL)))
        }
    }
    
    // Open the repository details in an external browser
    @objc private func goToURL() {
        guard let url = URL(string: viewModel.repository.html_url) else { return }
        UIApplication.shared.open(url)
    }
    
    // Navigate to user details
    @objc private func openUserDetails() {
        self.navigationController?.pushViewController(UserDetailsViewController(url: viewModel.repository.owner.url), animated: true)
    }
}

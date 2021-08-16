//
//  UserDetailsViewController.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    private let viewModel: UserDetailsViewModel
    private let ui = UserDetailsViewControllerUI()
    
    init(url: String) {
        self.viewModel = UserDetailsViewModel(url: url)
        super.init(nibName: nil, bundle: nil)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.cancelNetworkRequests()
    }
    
    private func setUI() {
        ui.addSubviews(to: self.view)
        
        viewModel.getUserDetails(url: viewModel.url) { [weak self] in
            guard let user = self?.viewModel.user else { return }
            self?.ui.avatarImageView.kf.setImage(with: URL(string: user.avatarURL))
            self?.ui.nameLabel.text = user.login
            self?.ui.fullNameLabel.text = user.name
            
             
            if let company = self?.viewModel.user?.company {
                self?.ui.companyLabel.set(image: UIImage(named: GKey.company), text: company)
            }
            if let place = self?.viewModel.user?.location {
                self?.ui.placeLabel.set(image: UIImage(named: GKey.place), text: place)
            }
            if let twitter = self?.viewModel.user?.twitterUsername {
                self?.ui.twitterLabel.set(image: UIImage(named: GKey.twitter), text: twitter)
            }
            if let bio = self?.viewModel.user?.bio {
                self?.ui.bioLabel.text = bio
            }
            if let link = self?.viewModel.user?.htmlURL{
                self?.ui.urlDetailsLabel.set(image: UIImage(named: GKey.link), text: link)
            }
            self?.ui.urlDetailsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self?.goToURL)))
            
        }
    }
    
    // Open the user details in an external browser
    @objc private func goToURL() {
        guard let url = URL(string: viewModel.user?.htmlURL ?? "") else { return }
        UIApplication.shared.open(url)
    }
}

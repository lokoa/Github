//
//  RepositoryCellUI.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit

class RepositoryCellUI {
    
    // MARK: Properties
    
    private let containerView: UIView = {
        let view = GKit.view
        return view
    }()
    let avatarImageButton: UIButton = {
        let view = GKit.button
        view.layer.cornerRadius = 5
        view.backgroundColor = Color.background
        view.layer.borderColor = Color.brand.cgColor
        view.layer.borderWidth = 0.2
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    let nameLabel: UILabel = {
        let view = GKit.labelMediumBold
        view.textColor = Color.brand
        view.lineBreakMode = .byTruncatingTail
        return view
    }()
    let authorLabel: UILabel = {
        let view = GKit.labelSmall
        view.textColor = Color.text2
        return view
    }()
    let descriptionLabel: UILabel = {
        let view = GKit.labelMedium
        view.numberOfLines = 0
        return view
    }()
    private let numbersStackView: UIStackView = {
        let view = GKit.hStackView
        view.distribution = .equalSpacing
        view.alignment = .fill
        view.spacing = 5
        return view
    }()
    var forksLabel: IconLabelView = {
        let view = IconLabelView()
        return view
    }()
    
    var watchersLabel: IconLabelView = {
        let view = IconLabelView()
        return view
    }()
    
    var issuesLabel: IconLabelView = {
        let view = IconLabelView()
        return view
    }()
    
    // MARK: Func

    func addSubviews(to mainView: UITableViewCell) {
        mainView.selectionStyle = .none
        mainView.backgroundColor = .clear
        addContainerView(mainView)
        addAvatarView()
        addNameLabek()
        addAuthorView()
        addDescriptionLabel()
        addNumbersStackView()
//        addStarsImageViewAndLabel()
    }
    // Subviews
    private func addContainerView(_ mainView: UIView) {
        mainView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: mainView.layoutMarginsGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: mainView.layoutMarginsGuide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: mainView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    private func addAvatarView() {
        containerView.addSubview(avatarImageButton)
        avatarImageButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        avatarImageButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        avatarImageButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        avatarImageButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    private func addNameLabek() {
        containerView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: avatarImageButton.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageButton.trailingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    private func addAuthorView() {
        containerView.addSubview(authorLabel)
        authorLabel.bottomAnchor.constraint(equalTo: avatarImageButton.bottomAnchor).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: avatarImageButton.trailingAnchor, constant: 8).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    private func addDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: avatarImageButton.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//        descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    }
    private func addNumbersStackView() {
        containerView.addSubview(numbersStackView)
        numbersStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        numbersStackView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        numbersStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        numbersStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        numbersStackView.addArrangedSubview(forksLabel)
        numbersStackView.addArrangedSubview(watchersLabel)
        numbersStackView.addArrangedSubview(issuesLabel)
    }
}

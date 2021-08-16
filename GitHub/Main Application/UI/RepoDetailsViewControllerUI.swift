//
//  RepoDetailsViewControllerUI.swift
//  GitHub
//
//  Created by Ana Kresic on 11/08/2021.
//

import UIKit

class RepoDetailsViewControllerUI {
    
    let scrollView: UIScrollView = {
        let view = GKit.scrollView
        view.isScrollEnabled = true
        return view
    }()
    
    let containerView = GKit.view
    
    let avatarImageView: UIImageView = {
        let view = GKit.avatarImageView
        return view
    }()
    let authorLabel: UILabel = {
        let view = GKit.labelSmall
        view.textColor = Color.text2
        return view
    }()
    let languageLabel: UILabel = {
        let view = GKit.labelSmall
        view.textColor = Color.text2
        view.contentMode = .right
        return view
    }()
    let nameLabel: UILabel = {
        let view = GKit.labelLargeBold
        view.textColor = Color.brand
        view.adjustsFontSizeToFitWidth = false
        view.lineBreakMode = .byTruncatingTail
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let view = GKit.labelMedium
        view.numberOfLines = 0
        return view
    }()
    
    private let numbersStackView: UIStackView = {
        let view = GKit.hStackView
//        view.backgroundColor = Color.background
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 8
        return view
    }()
    
    var detailsUrlLabel: IconLabelView = {
        let view = IconLabelView()
        return view
    }()
    
    var starsLabel: IconLabelView = {
        let view = IconLabelView()
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
    
    
    func addSubviews(to mainView: UIView) {
        mainView.backgroundColor = Color.background
//        containerView.backgroundColor = Color.background
        addScrollView(mainView)
        addAvatarView()
        addAuthorLabel()
        addLanguageLabel()
        addNameLabel()
        addDescriptionLabel()
        addDetailsUrlLabel()
        addNumbersStackView()
    }
    
    // Subviews
    private func addScrollView(_ mainView: UIView) {
        mainView.addSubview(scrollView)
        scrollView.backgroundColor = Color.backgroundLighter
        containerView.backgroundColor = Color.backgroundLighter
        scrollView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.addSubview(containerView)
        setupScrollViewContent(mainView)
    }
    
    private func addAvatarView() {
        containerView.addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    private func addAuthorLabel() {
        containerView.addSubview(authorLabel)
        authorLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        authorLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8).isActive = true
        authorLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    private func addLanguageLabel() {
        containerView.addSubview(languageLabel)
        languageLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
//        languageLabel.leadingAnchor.constraint(equalTo: authorLabel.trailingAnchor, constant: 8).isActive = true
        languageLabel.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    private func addNameLabel() {
        containerView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    private func addDetailsUrlLabel() {
        containerView.addSubview(detailsUrlLabel)
        detailsUrlLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        detailsUrlLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        detailsUrlLabel.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
//        detailsUrlLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func addNumbersStackView() {
        containerView.addSubview(numbersStackView)
        numbersStackView.topAnchor.constraint(equalTo: detailsUrlLabel.bottomAnchor, constant: 20).isActive = true
        numbersStackView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor).isActive = true
        numbersStackView.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
        numbersStackView.addArrangedSubview(starsLabel)
        numbersStackView.addArrangedSubview(forksLabel)
        numbersStackView.addArrangedSubview(watchersLabel)
        numbersStackView.addArrangedSubview(issuesLabel)
    }
    
    private func addDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    private func setupScrollViewContent(_ mainView: UIView) {
        containerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.trailingAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        let contentViewCenterY = containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow
        let contentViewHeight = containerView.heightAnchor.constraint(greaterThanOrEqualTo: mainView.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewCenterY.isActive = true
        contentViewHeight.isActive = true
    }
}

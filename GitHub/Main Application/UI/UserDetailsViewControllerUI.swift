//
//  UserDetailsViewControllerUI.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import UIKit

class UserDetailsViewControllerUI {
    
    let scrollView: UIScrollView = {
        let view = GKit.scrollView
        view.isScrollEnabled = true
        view.keyboardDismissMode = .onDrag
        view.bounces = false
        view.alwaysBounceVertical = false
        return view
    }()
    
    let containerView = GKit.view
    
    let avatarImageView: UIImageView = {
        let view = GKit.imageView
        view.layer.cornerRadius = 8
        view.backgroundColor = Color.background
        view.layer.borderColor = Color.brand.cgColor
        view.layer.borderWidth = 0.4
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let detailsStackView: UIStackView = {
        let view = GKit.vStackView
        view.distribution = .equalSpacing
        view.alignment = .fill
        view.spacing = 8
        return view
    }()
    
    private let mainStackView: UIStackView = {
        let view = GKit.vStackView
        view.distribution = .equalSpacing
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = GKit.labelLargeBold
        view.textColor = Color.brand
        return view
    }()
    let fullNameLabel: UILabel = {
        let view = GKit.labelMedium
        view.textColor = Color.text
        return view
    }()
    
    var companyLabel: IconLabelView = {
        let view = IconLabelView()
        view.label.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    var placeLabel: IconLabelView = {
        let view = IconLabelView()
        view.label.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    var twitterLabel: IconLabelView = {
        let view = IconLabelView()
        view.label.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    let bioLabel: UILabel = {
        let view = GKit.labelMedium
        view.textColor = Color.text
        view.numberOfLines = 0
        return view
    }()
    
    var urlDetailsLabel: IconLabelView = {
        let view = IconLabelView()
        return view
    }()
    
    func addSubviews(to mainView: UIView) {
        mainView.backgroundColor = Color.background
        addScrollView(mainView)
        addAvatarView()
        addDetailsStackView()
        addMainStackView()
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
        avatarImageView.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    private func addDetailsStackView() {
        containerView.addSubview(detailsStackView)
        detailsStackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor).isActive = true
        detailsStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16).isActive = true
        detailsStackView.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor, constant: -8).isActive = true
        detailsStackView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
        detailsStackView.addArrangedSubview(nameLabel)
        detailsStackView.addArrangedSubview(fullNameLabel)
        detailsStackView.addArrangedSubview(companyLabel)
        detailsStackView.addArrangedSubview(placeLabel)
        detailsStackView.addArrangedSubview(twitterLabel)
    }
    
    private func addMainStackView() {
        containerView.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor).isActive = true
        mainStackView.addArrangedSubview(bioLabel)
        mainStackView.addArrangedSubview(urlDetailsLabel)
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

//
//  LoadingView.swift
//  GitHub
//
//  Created by Ana Kresic on 12/08/2021.
//

import UIKit

class LoadingView: UIView {

    // MARK: Proporties
    
    private let loadingIndicator = UIActivityIndicatorView()
    private let loadingLabel = GKit.labelMedium
    private let blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.dark))
    
    // MARK: View methods
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    // MARK: Custom func
    
    func setBackgroundClear() { blur.isHidden = true }
    
    func loading(_ value: Bool) {
        value ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
        self.isHidden = !value
    }
}

// MARK: Subviews

extension LoadingView {
    private func addViews() {
        addBlur()
        addLoadingIndicator()
        addLoadingLabel()
    }
    // Subviews
    private func addBlur() {
        blur.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blur)
        blur.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blur.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blur.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blur.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    private func addLoadingIndicator() {
        loadingIndicator.color = Color.text
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingIndicator.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -2).isActive = true
    }
    private func addLoadingLabel() {
        loadingLabel.text = "Loading"
        loadingLabel.textAlignment = .center
        loadingLabel.numberOfLines = 0
        addSubview(loadingLabel)
        loadingLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 2).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
}

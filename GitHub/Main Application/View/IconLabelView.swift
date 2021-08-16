//
//  IconLabelView.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//


import UIKit

class IconLabelView: UIStackView {
    
    // MARK: Proporties
    
    private let iconView = GKit.imageView
    let label = GKit.labelMedium
    
    // MARK: View methods
    
    init() {
        
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 5
        setViews()
    }
    
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
//    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: Custom func
//    func setText(font: UIFont?, color: UIColor? = nil) {
//        if let font = font {
//            firstLabel.font = font
//            secondLabel.font = font
//        }
//        if let color = color {
//            firstLabel.textColor = color
//            secondLabel.textColor = color
//        }
//    }
    func set(image: UIImage?, text: String) {
        iconView.contentMode = .scaleAspectFit
        iconView.image = image
        label.text = text
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
    }
    
//    func setImageSize(width: CGFloat, height: CGFloat){
//        iconView.widthAnchor.constraint(equalToConstant: width).isActive = true
//        iconView.heightAnchor.constraint(equalToConstant: height).isActive = true
//    }
}

// MARK: Subviews

extension IconLabelView {
    private func setViews() {
        sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
        addImageView()
        addLabel()
    }
    // Subviews
    private func addImageView() {
        addArrangedSubview(iconView)
        iconView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    private func addLabel() {
        label.sizeToFit()
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        addArrangedSubview(label)
    }
}

//
//  GExtensions.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit
import Kingfisher

// Show 'no results found' message if tableview is empty
extension UITableView {
    func setNoResultsMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = Color.text
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Roboto-Bold", size: 17)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func removeNoResultsMessage() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

// Add parameters to request
extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

// Present thousands and millions in short way
extension Int {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 { return "\(round(million*10)/10)m" }
        else if thousand >= 1.0 { return "\(round(thousand*10)/10)k".replacingOccurrences(of: ".0", with: "") }
        else { return "\(self)" }
    }
}

// Set search bar text color
extension UISearchBar {
    func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
}

// Kingfisher rounded image
extension UIImageView {
    func download(url: String?, rounded: Bool = true) {
        guard let _url = url else { return }
        if rounded {
            let processor = ResizingImageProcessor(referenceSize: self.frame.size) |> RoundCornerImageProcessor(cornerRadius: self.frame.size.width / 2)
            self.kf.setImage(with: URL(string: _url), placeholder: nil, options: [.processor(processor)])
        } else {
            self.kf.setImage(with: URL(string: _url))
        }
    }
}

// Button with image and text
extension UIButton {
    func set(image: UIImage, with text: String) {
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.setImage(image, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        self.setTitle(text, for: .normal)
        self.setTitleColor(Color.brand, for: .normal)
        self.setTitleColor(Color.text2, for: .selected)
        self.backgroundColor = .red
    }
}

extension UILabel {
    func set(image: UIImage, with text: String) {
        // Create Attachment
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = image
        // Set bound to reposition
        let imageOffsetY: CGFloat = -3
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 15, height: 15)
        // Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        let completeText = NSMutableAttributedString(string: " ")
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        let textAfterIcon = NSAttributedString(string: " " + text)
        completeText.append(textAfterIcon)
        self.attributedText = completeText
    }
}

extension UIViewController {
    func present(vc: UIViewController, animated flag: Bool) {
        if #available(iOS 13.0, *), vc.modalPresentationStyle == .automatic || vc.modalPresentationStyle == .pageSheet { vc.modalPresentationStyle = .fullScreen }
        present(vc, animated: flag)
    }
}

extension NSObject { static var className: String { String(describing: self) } }

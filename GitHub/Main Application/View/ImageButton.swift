//
//  ImageButton.swift
//  GitHub
//
//  Created by Ana Kresic on 10/08/2021.
//

import UIKit

class ImageButton: UIButton {

    typealias DidTapButton = (ImageButton) -> ()

    var didTouchUpInside: DidTapButton? {
        didSet {
            if didTouchUpInside != nil {
                addTarget(self, action: #selector(didTouchUpInside(sender:)), for: .touchUpInside)
            } else {
                removeTarget(self, action: #selector(didTouchUpInside(sender:)), for: .touchUpInside)
            }
        }
    }

    // MARK: - Actions

    @objc func didTouchUpInside(sender: UIButton) {
        if let handler = didTouchUpInside {
            handler(self)
        }
    }

}

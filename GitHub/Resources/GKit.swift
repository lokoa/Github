//
//  GKit.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit

struct GKit {
    
    // MARK: View
    static var view: UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    // MARK: StackView (horizontal)
    static var hStackView: UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    // MARK: StackView (vertical)
    static var vStackView: UIStackView {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    // MARK: TableView
    static var tableView: UITableView {
        let view = UITableView()
        view.separatorColor = Color.separatorColor
        view.keyboardDismissMode = .onDrag
//        view.bounces = false
        //        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    // MARK: Label
    private static var label: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Color.text
        return label
    }
    
    // MARK: Avatar ImageView
    static var avatarImageView: UIImageView {
        let view = imageView
        view.layer.cornerRadius = 5
        view.backgroundColor = Color.background
        view.layer.borderColor = Color.brand.cgColor
        view.layer.borderWidth = 0.2
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    }
    
    
    static var imageView: UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static var labelSmall: UILabel {
        let view = label
//        view.font = UIFont.systemFont(ofSize: 12)
        view.font = UIFont(name: "Roboto-Regular", size: 12)
        return view
    }
    
    static var labelMediumBold: UILabel {
        let view = label
        //        label.font = UIFont(name: "roboto", size: 9)
//        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        view.font = UIFont(name: "Roboto-Bold", size: 14)
        return view
    }
    
    static var labelLargeBold: UILabel {
        let view = label
//        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        view.font = UIFont(name: "Roboto-Bold", size: 18)
        return view
    }
    
    static var searchController: UISearchController {
        let view = UISearchController(searchResultsController: nil)
        
        //        view.obscuresBackgroundDuringPresentation = true
        //
        //        view.searchBar.tintColor = UIColor.white
        //        view.searchBar.barTintColor = UIColor.red
        return view
    }
    static var labelMedium: UILabel {
        let view = label
//        view.font = UIFont.systemFont(ofSize: 14)
        view.font = UIFont(name: "Roboto-Regular", size: 14)
        return view
    }
    
    static var scrollView: UIScrollView {
        let view = UIScrollView()
        view.keyboardDismissMode = .onDrag
        view.bounces = false
        view.alwaysBounceVertical = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    //    // MARK: Button
    static var button: UIButton {
        let button = UIButton()
        button.setTitleColor(Color.text, for: .highlighted)
        button.setTitleColor(Color.text, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    //
    //    static var labelHugeBold: UILabel {
    //        let label = RLabel
    //        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    //        return label
    //    }
    //    static var labelHuge: UILabel {
    //        let label = RLabel
    //        label.font = UIFont.systemFont(ofSize: 20)
    //        return label
    //    }
    //    static var labelLarge: UILabel {
    //        let label = RLabel
    //        label.font = UIFont.systemFont(ofSize: 18)
    //        return label
    //    }
    
    
    //
    //    static var labelSmallBold: UILabel {
    //        let label = RLabel
    //        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    //        return label
    //    }
    //    static var labelMicro: UILabel {
    //        let label = RLabel
    //        label.font = UIFont.systemFont(ofSize: 8)
    //        return label
    //    }
    //    static var labelIconLarge: UILabel {
    //        let label = RLabel
    //        label.font = UIFont(name: RString.RFont, size: 24)
    //        return label
    //    }
    //    static var labelIcon: UILabel {
    //        let label = RLabel
    //        label.font = UIFont(name: RString.RFont, size: 20)
    //        return label
    //    }
    //    static var labelIconSmall: UILabel {
    //        let label = RLabel
    //        label.font = UIFont(name: RString.RFont, size: 16)
    //        return label
    //    }
    //    static var labelIconMicro: UILabel {
    //        let label = RLabel
    //        label.font = UIFont(name: RString.RFont, size: 7)
    //        return label
    //    }
    
    //    static var brandButton: UIButton {
    //        let button = RButton
    //        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    //        button.setTitleColor(Color.textblack, for: .normal)
    //        button.setTitleColor(Color.textblack, for: .highlighted)
    //        button.backgroundColor = Color.brand
    //        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
    //        button.setCornerRadius(radius: 2)
    //        return button
    //    }
    //    // MARK: ImageView
    //
    //    // MARK: UITextField
    //    static var rTextField: UITextField {
    //        let tf = UITextField()
    //        tf.font = UIFont.systemFont(ofSize: 14)
    //        tf.translatesAutoresizingMaskIntoConstraints = false
    //        tf.textColor = Color.text
    //        return tf
    //    }
    //
    //    // MARK: StackView
    
    //
    
    
    
}

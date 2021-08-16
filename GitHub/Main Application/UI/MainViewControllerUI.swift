//
//  MainViewControllerUI.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit

class MainViewControllerUI {
    
    // MARK: Properties
    
    let tableView: UITableView = {
        let view = GKit.tableView
        view.backgroundColor = Color.backgroundLighter
//        view.showsVerticalScrollIndicator = false
        view.register(RepositoryCell.self, forCellReuseIdentifier: RepositoryCell.className)
        return view
    }()
    let loadingView = LoadingView()
    
    // MARK: Func
    
    func addSubviews(to mainView: UIView) {
        mainView.backgroundColor = Color.background
        addTableView(mainView)
        addLoadingView(mainView)
    }
    
    // Subviews
    private func addTableView(_ mainView: UIView) {
        mainView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: mainView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    private func addLoadingView(_ mainView: UIView) {
        mainView.addSubview(loadingView)
        loadingView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        loadingView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: mainView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
}

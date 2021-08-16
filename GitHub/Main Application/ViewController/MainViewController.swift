//
//  MainViewController.swift
//  GitHub
//
//  Created by Ana Kresic on 09/08/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: Properties
    
    private let ui = MainViewControllerUI()
    private let apiService = RepositoryApiService()
    private let searchController = GKit.searchController
    private let viewModel = RepositoryViewModel()
    private var isSearchBarEmpty: Bool { return searchController.searchBar.text?.isEmpty ?? true}
    
    // MARK: ViewController lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Current configuration: \(BuildConfiguration.shared.environment)")
        setNavigation()
        setUI()
        searchRepository(search: GConstants.initial_search, sort: GConstants.initial_sort, per_page: GConstants.initial_per_page)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.cancelNetworkRequests()
    }
    
    func setNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(loginTapped))
        let imageView = UIImageView(image: UIImage(named: GKey.github))
        imageView.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        ui.tableView.reloadData()
        ui.tableView.layoutSubviews()
    }
    
    @objc private func getData() {}
    
    private func setUI() {
        ui.addSubviews(to: self.view)
        ui.loadingView.loading(true)
        ui.tableView.delegate = self
        ui.tableView.dataSource = self
        ui.tableView.refreshControl?.addTarget(self, action: #selector(getData), for: .valueChanged)
        
        searchController.searchBar.scopeButtonTitles = ["Stars", "Forks", "Updated"]
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.textColor = Color.text2
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search repositories"
        searchController.searchBar.searchTextField.leftView?.tintColor = Color.text2
        searchController.searchBar.tintColor = Color.brand
        searchController.searchBar.barTintColor = Color.backgroundLighter
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        extendedLayoutIncludesOpaqueBars = true
    }
    
    @objc func loginTapped(){ print("Login viewController") }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.repositories.count == 0 {
            tableView.setNoResultsMessage("Currently there is no data for selected parameters!")
        }else {
            tableView.removeNoResultsMessage()
        }
        return viewModel.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.className) as? RepositoryCell
        let data = viewModel.repositories[indexPath.row]
        cell?.set(repository: data)
        cell?.ui.avatarImageButton.tag = indexPath.row
        
        if BuildConfiguration.shared.environment == .debugProduction {
            cell?.ui.avatarImageButton.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)
        }
        return cell ?? UITableViewCell()
    }
    
    @objc func subscribeTapped(_ sender: UIButton){
        // use the tag of button as index
        self.navigationController?.pushViewController(UserDetailsViewController(url: viewModel.repositories[sender.tag].owner.url), animated: true)
        print(viewModel.repositories[sender.tag].owner.url)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if BuildConfiguration.shared.environment == .debugProduction
            || BuildConfiguration.shared.environment == .debugStaging {
            DispatchQueue.main.async { [weak self] in
                guard let repository = self?.viewModel.repositories[indexPath.row] else { return }
                self?.navigationController?.pushViewController(RepositoryDetailsViewController(repository: repository), animated: true)
            }
        }
    }
}

// MARK: UISearchResultsUpdating, UISearchBarDelegate

extension MainViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        ui.tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if !isSearchBarEmpty {
            searchRepository(search: searchBar.text ?? "", sort: viewModel.sortType, per_page: GConstants.per_page)
        }
    }
    
    func searchRepository(search: String, sort: String, per_page: String) {
        let parameters = [
            GKey.q : search,
            GKey.page : GConstants.page,
            GKey.per_page : per_page,
            GKey.sort : sort,
            GKey.order : GConstants.order
        ]
        
        ui.loadingView.loading(true)
        viewModel.getRepositoryList(parameters: parameters) { [weak self] in
            self?.ui.loadingView.loading(false)
            self?.ui.tableView.reloadData()
            self?.viewModel.defaults.set(search, forKey: GKey.search)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0: viewModel.sortType = sortType.stars.rawValue
        case 1: viewModel.sortType = sortType.forks.rawValue
        case 2: viewModel.sortType = sortType.updated.rawValue
        default: break
        }
        
        if isSearchBarEmpty {
            searchRepository(search: GConstants.initial_search, sort: viewModel.sortType, per_page: GConstants.per_page)
        } else {
            searchRepository(search: searchBar.text ?? "", sort: viewModel.sortType, per_page: GConstants.per_page)
        }
    }
}

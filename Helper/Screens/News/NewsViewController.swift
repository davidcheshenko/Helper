//
//  NewsViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: Private properties
    
    private var articles: [Article] = []
    private let viewModel: INewsViewModel
    private let tableView = UITableView()
    
    // MARK: Lifecycle
    
    init(viewModel: INewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureLayout()
        bindViewModel()
        viewModel.viewDidLoad()
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NewsCellID, for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        
        cell.set(title: articles[indexPath.row].title)
        cell.set(subtitle: articles[indexPath.row].description)
        
        viewModel.fetchImageData(string: articles[indexPath.row].urlToImage) { data in
            DispatchQueue.main.async {
                cell.set(image: UIImage(data: data))
            }
        }
        return cell
    }
}

private extension NewsViewController {
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindViewModel() {
        viewModel.onNewsLoaded = { [weak self] articles in
            DispatchQueue.main.async {
                self?.articles = articles
                self?.tableView.reloadData()
            }
        }
        viewModel.onError = { [weak self] message in
            DispatchQueue.main.async {
                self?.showErrorAlert(message: message)
            }
        }
    }
    
    func showErrorAlert(message: String?) {
        let alert = UIAlertController (title: "Error", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

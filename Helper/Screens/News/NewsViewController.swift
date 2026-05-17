//
//  NewsViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: Private properties
    
    private var viewModel: INewsViewModel
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
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        let article = viewModel.articles [indexPath.row]
        cell.set(title: article.title)
        cell.set(subtitle: article.description)
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
        
        viewModel.onNewsLoaded = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

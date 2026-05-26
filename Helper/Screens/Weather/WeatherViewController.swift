//
//  WeatherViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Private properties
    
    private var weather: [Weather] = []
    private let viewModel: IWeatherViewModel
    private let tableView = UITableView()
    
    // MARK: Lifecycle
    
    init(viewModel: IWeatherViewModel) {
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

extension WeatherViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.WeatherCellID, for: indexPath) as? WeatherCell else {
            return UITableViewCell()
        }
    
        cell.set(title: weather[indexPath.row].description ?? "")
        cell.set(subtitle: viewModel.weatherResponse?.name ?? "")
        cell.set(temp: viewModel.weatherResponse?.main?.temp)
        cell.set(wind: viewModel.weatherResponse?.wind)
        cell.set(humidity: viewModel.weatherResponse?.main?.humidity)


        viewModel.fetchImageData(string: weather[indexPath.row].urlToImage) { data in
            DispatchQueue.main.async {
                cell.set(image: UIImage(data: data))
            }
        }
        return cell
    }
}

private extension WeatherViewController {
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindViewModel() {
        viewModel.onWeatherLoaded = { [weak self] weather in
            DispatchQueue.main.async {
                self?.weather = weather
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


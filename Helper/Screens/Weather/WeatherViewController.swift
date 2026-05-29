//
//  WeatherViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: IWeatherViewModel
    private let locationService: ILocationService
    
    private let backgroundImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "weatherImage")
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 64, weight: .bold)
        label.textColor = .purple
        label.textAlignment = .center
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .orange
        label.textAlignment = .center
        return label
    }()
    
    private let windLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .darkGray
        return label
    }()
    
    private let labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: IWeatherViewModel, locationService: ILocationService) {
        self.viewModel = viewModel
        self.locationService = locationService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconImageView.contentMode = .center
        iconImageView.tintColor = .systemYellow
        locationService.requestPermissions()
        configureUI()
        configureLayout()
        bindViewModel()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func configureUI() {
        view.addSubview(backgroundImage)
        view.addSubview(iconImageView)
        view.addSubview(labelsStackView)
        
        labelsStackView.addArrangedSubview(cityLabel)
        labelsStackView.addArrangedSubview(tempLabel)
        labelsStackView.addArrangedSubview(descriptionLabel)
        labelsStackView.addArrangedSubview(windLabel)
        
    }
    
    private func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.width.equalTo(140)
            make.height.equalTo(140)
        }
        
        labelsStackView.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    private func bindViewModel() {
        
        viewModel.onWeatherLoaded = { [weak self] _ in
            DispatchQueue.main.async {
                
                guard let self = self,
                      let weatherResponse = self.viewModel.weatherResponse
                else { return }
                
                self.cityLabel.text = weatherResponse.name
                
                if let temp = weatherResponse.main?.temp {
                    self.tempLabel.text = "\(Int(temp))°C"
                }
                
                if let weather = weatherResponse.weather?.first {
                    
                    self.descriptionLabel.text =
                    weather.description?.capitalized
                    
                    let config = UIImage.SymbolConfiguration(
                        pointSize: 100,
                        weight: .medium
                    )
                    
                    self.iconImageView.image = UIImage(
                        systemName: weather.systemIconName,
                        withConfiguration: config
                    )
                }
                
                if let speed = weatherResponse.wind?.speed {
                    self.windLabel.text = "Wind: \(speed) м/s"
                }
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

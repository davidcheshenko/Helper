//
//  WeatherCell.swift
//  Helper
//
//  Created by David Cheshenko on 22.05.26.
//

import UIKit
import SnapKit

class WeatherCell: UITableViewCell {
    
    //MARK: - Private properties
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let iconView = UIImageView()
    private let tempLabel = UILabel()
    private let windLabel  = UILabel()
    private let humidityLabel = UILabel()
    private let contentStackView = UIStackView()
    private let textStackView = UIStackView()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func set(image: UIImage?) {
        iconView.image = image
        iconView.isHidden = image == nil
    }
    
    func set(title: String?) {
        titleLabel.text = title
        titleLabel.isHidden = title == nil
    }
    
    func set(subtitle: String?) {
        subTitleLabel.text = subtitle
        subTitleLabel.isHidden = subtitle == nil
    }
    func set(temp: Double?) {
        tempLabel.text = temp != nil ? "Temperature: \(Int(temp!))°C" : ""
        tempLabel.isHidden = temp == nil
    }

    func set(wind: Wind?) {
        windLabel.text = wind?.speed != nil ? "Wind: \(wind!.speed!) м/с" : ""
        windLabel.isHidden = wind?.speed == nil
    }

    func set(humidity: Int?) {
        humidityLabel.text = humidity != nil ? "Humidity: \(humidity!)%" : ""
        humidityLabel.isHidden = humidity == nil
    }

}

private extension WeatherCell {
    
    func configureUI() {
        iconView.layer.cornerRadius = 10
        iconView.isHidden = true
        
        
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 2
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.textColor = .gray
        
        textStackView.axis = .vertical
        textStackView.spacing = 4
        
        contentStackView.spacing = 12
        contentStackView.alignment = .center
        
        contentView.addSubview(contentStackView)
        [iconView, textStackView].forEach(contentStackView.addArrangedSubview)
        [titleLabel, subTitleLabel, tempLabel, windLabel, humidityLabel].forEach(textStackView.addArrangedSubview)
    }
    
    func configureLayout() {
        contentStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
        
        iconView.snp.makeConstraints { make in
            make.size.equalTo(50)
        }
    }
}

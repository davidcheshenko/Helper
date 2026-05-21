//
// NewsCell.swift
//  Helper
//
//  Created by David Cheshenko on 22.04.26.
//

import UIKit
import SnapKit

class NewsCell: UITableViewCell {
    
    //MARK: - Private properties
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let iconView = UIImageView()
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
}

private extension NewsCell {
    
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
        [titleLabel, subTitleLabel].forEach(textStackView.addArrangedSubview)
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

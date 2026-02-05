//
//  MapButtonContainerView.swift
//  Helper
//
//  Created by David Cheshenko on 04.02.26.
//

import UIKit

class MapButtonContainerView: UIView {

    private let stackView = UIStackView()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private let locationButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MapButtonContainerView {
    
    func configureUI() {
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        locationButton.setImage(UIImage(systemName: "location"), for: .normal)
        
        [plusButton, minusButton, locationButton].forEach {
            $0.backgroundColor = .white
            $0.tintColor = .black
            $0.layer.cornerRadius = 22
        }
        
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        
        [plusButton, minusButton, locationButton].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(44)
            }
        }
    }
    
    func configureLayout() {
        stackView.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview()
        }
        
        [plusButton, minusButton, locationButton].forEach(stackView.addArrangedSubview)
    }
    
    @objc func plusButtonTapped() {
        print("plusButtonTapped")
    }
    
    @objc func minusButtonTapped() {
        print("minusButtonTapped")
    }
    
    @objc func locationButtonTapped() {
        print("locationButtonTapped")
    }
}

//
//  MapButtonContainerView.swift
//  Helper
//
//  Created by David Cheshenko on 04.02.26.
//

import UIKit
import SnapKit

class MapButtonContainerView: UIView {
    
    //MARK: - Private properties
    
    private let stackView = UIStackView()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private let locationButton = UIButton()
    private let size = 44.0
    
    //MARK: - Lifecycle
    
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
        stackView.axis = .vertical
        stackView.spacing = 12
        
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        locationButton.setImage(UIImage(systemName: "location"), for: .normal)
        
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        
        [plusButton, minusButton, locationButton].forEach {
            $0.backgroundColor = . white
            $0.tintColor = . black
            $0.layer.cornerRadius = size / 2
            stackView.addArrangedSubview($0)
        }
    }
    
    func configureLayout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
                    $0.edges.equalToSuperview()
                }
        
        [plusButton, minusButton, locationButton].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(size)
            }
        }
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

//
//  MapViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit
import MapKit
import SnapKit

class MapViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let mapButtonsView = MapButtonContainerView()
    private let viewModel: IMapViewModel
    private let mapView = MKMapView()
    
    // MARK: - Lifecycle
    
    init(viewModel: IMapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
}

private extension MapViewController {
    
    func configureLayout() {
        
        [mapView, mapButtonsView].forEach(view.addSubview)
        
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mapButtonsView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}

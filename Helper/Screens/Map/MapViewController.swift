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
    
    // MARK: Private properties
    
    private let mapButtonsView = MapButtonContainerView()
    private let viewModel: IMapViewModel
    private let mapView = MKMapView()
    
    // MARK: Lifecycle
    
    init(viewModel: IMapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension MapViewController {
    
    func setupUI() {
        title = Constants.map
        view.backgroundColor = .systemBackground
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.addSubview(mapView)
        view.addSubview(mapButtonsView)
        
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mapButtonsView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(44)
        }
    }
}


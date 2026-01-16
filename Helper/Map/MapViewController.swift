//
//  MapViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: Private properties
    
    private var viewModel: IMapViewModel
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
        title = "map"
        setupUI()
        bindViewModel()
    }
}

private extension MapViewController {

    func setupUI() {
        title = "Map"
        view.backgroundColor = .systemBackground

        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func bindViewModel() {
           viewModel.onRegionChanged = { [weak self] region in
               self?.mapView.setRegion(region, animated: true)
           }

           viewModel.viewDidLoad()
       }
}

  




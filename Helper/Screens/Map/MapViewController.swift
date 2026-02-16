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
        configureUI()
        configureLayout()
        bind()
        viewModel.viewDidLoad()
    }
}

private extension MapViewController {
    
    func configureUI() {
        mapView.showsUserLocation = true
    }
    
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
    
    func bind() {
        mapButtonsView.plusButtonCompletion = { [weak self] in
            self?.zoomIn()
        }
        
        mapButtonsView.minusButtonCompletion = { [weak self] in
            self?.zoomOut()
        }
        
        mapButtonsView.locationButtonCompletion = { [weak self] in
            self?.viewModel.checkUserLocation()
        }
        
        viewModel.onUserLocation = { [weak self] coordinates in
            guard let coordinates = coordinates else {
                self?.showAlert()
                return
            }
            self?.moveMapTo(coordinate: coordinates)
        }
        
        viewModel.onLocationDenied = { [weak self] in
            self?.showAlert()
        }
    }
    
    func zoomIn() {
        var region = mapView.region
        region.span.latitudeDelta *= 0.5
        region.span.longitudeDelta *= 0.5
        mapView.setRegion(region, animated: true)
    }
    
    func zoomOut() {
        var region = mapView.region
        region.span.latitudeDelta *= 2
        region.span.longitudeDelta *= 2
        mapView.setRegion(region, animated: true)
    }
    
    func moveMapTo(coordinate: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        mapView.setRegion(region, animated: true)
    }
    
    func showAlert() {
        // здесь будет показан алерт пользователю
    }
}

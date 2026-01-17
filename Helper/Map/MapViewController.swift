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
        bind()
    }
}

private extension MapViewController {

    func setupUI() {
        view.backgroundColor = .systemBackground
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)

        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bind() {
        viewModel.setRegion = { [weak self] region in
            self?.mapView.setRegion(region, animated: true)
        }
    }
}

  




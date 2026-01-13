//
//  MapViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit

class MapViewController: UIViewController {
    
    // MARK: Private properties
    
    private let viewModel: IMapViewModel
    
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
        view.backgroundColor = .systemGreen
                title = "map"
    }
}

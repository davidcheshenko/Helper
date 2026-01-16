//
//  MapViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 26.12.25.
//

import Foundation
import MapKit

final class MapViewModel: IMapViewModel {

    var onRegionChanged: ((MKCoordinateRegion) -> Void)?

    func viewDidLoad() {
        showUkraine()
    }

    private func showUkraine() {
        let coordinate = CLLocationCoordinate2D(
            latitude: 48.3794,
            longitude: 31.1656
        )

        let region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 6.0,
                longitudeDelta: 6.0
            )
        )

        onRegionChanged?(region)
    }
}


//
//  IServiceFactory.swift
//  Helper
//
//  Created by David Cheshenko on 30.01.26.
//

import Foundation

protocol IServiceFactory {
    
    var locationService: ILocationService { get }
}

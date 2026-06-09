//
//  IProfileViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 28.12.25.
//

import Foundation

protocol IProfileViewModel {
    
    var userName: String { get }
    var userEmail: String { get }
    var userPassword: String { get }
    
    var onDataChanged: (() -> Void)? { get set }
    var onError: ((String) -> Void)? { get set }
    
    func saveProfile (name: String, email: String, password: String)
}

//
//  ProfileViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 28.12.25.
//

import Foundation

class ProfileViewModel: IProfileViewModel {
    
    // MARK: Private properties

    private enum Keys {
        static let name = "user_name_key"
        static let email = "user_email_key"
        static let password = "user_password_key"
    }
    
    private var profile: Profile {
        didSet { onDataChanged?() }
    }
    
    // MARK: - Public methods

    var userName: String { profile.name }
    var userEmail: String { profile.email }
    var userPassword: String { profile.password }
    
    var onDataChanged: (() -> Void)?
    var onError: ((String) -> Void)?

    // MARK: Lifecycle

    init(profile: Profile = Profile(name: "", email: "", password: "")) {
        let savedName = UserDefaults.standard.string(forKey: Keys.name) ?? ""
        let savedEmail = UserDefaults.standard.string(forKey: Keys.email) ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: Keys.password) ?? ""
        
        guard !savedName.isEmpty, !savedEmail.isEmpty, !savedPassword.isEmpty else {
            self.profile = profile
            return
        }
        self.profile = Profile(name: savedName, email: savedEmail, password: savedPassword)
    }
    
    // MARK: Public methods

    func saveProfile(name: String, email: String, password: String) {
        
        guard !name.isEmpty else {
            onError? ("The name cannot be empty")
            return
        }
    
        guard email.contains("@") && email.contains(".") else {
            onError?("Invalid email format Email")
            return
        }
       
        guard password.count < 6 else {
            onError? ("The password must contain at least 6 characters")
            return
        }
        
        UserDefaults.standard.set(name, forKey: Keys.name)
        UserDefaults.standard.set(email, forKey: Keys.email)
        UserDefaults.standard.set(password, forKey: Keys.password)
        
        self.profile = Profile(name: name, email: email, password: password)
    }
}


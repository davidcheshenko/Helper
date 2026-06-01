//
//  ProfileViewModel.swift
//  Helper
//
//  Created by David Cheshenko on 28.12.25.
//

import Foundation

class ProfileViewModel: IProfileViewModel {
    
    private enum Keys {
        static let name = "user_name_key"
        static let email = "user_email_key"
        static let password = "user_password_key"
    }
    
    var userName: String { profile.name }
    var userEmail: String { profile.email }
    var userPassword: String { profile.password }
    
    var onDataChanged: (() -> Void)?
    var onErrorOccurrad: ((String) -> Void)?
    
    private var profile: Profile {
        didSet { onDataChanged?() }
    }
    
    init(profile: Profile) {
        let savedName = UserDefaults.standard.string(forKey: Keys.name) ?? ""
        let savedEmail = UserDefaults.standard.string(forKey: Keys.email) ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: Keys.password) ?? ""
        
        if !savedName.isEmpty || !savedEmail.isEmpty || !savedPassword.isEmpty {
            self.profile = Profile(name: savedName, email: savedEmail, password: savedPassword)
        } else {
            
            self.profile = profile
        }
    }
    
    func saveProfile(name: String, email: String, password: String) {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedName.isEmpty {
            onErrorOccurrad? ("имя не может быть пустым")
            return
        }
        
        if password.count < 6 {
            onErrorOccurrad? ("Пороль должен содержать минимум 6 символов")
            return
        }
    }
}

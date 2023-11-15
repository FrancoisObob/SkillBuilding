//
//  AccountViewModel.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/15/23.
//

import SwiftUI

final class AccountViewModel: ObservableObject {

    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?

    func saveChanges() {
        guard isValidForm else { return }

        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = .init(formError: .userSaveSuccess)
        } catch {
            alertItem = .init(formError: .invalidUserData)
        }
    }

    func retrieveUser() {
        do {
            guard let userData else { return }
            self.user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = .init(formError: .invalidUserData)
        }
    }

    var isValidForm: Bool {
        guard !user.firstName.isEmpty  && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = .init(formError: .invalidForm)
            return false
        }

        guard user.email.isValidEmail else {
            alertItem = .init(formError: .invalidEmail)
            return false
        }

        return true
    }
}

enum FormError {
    case invalidForm
    case invalidEmail
    case userSaveSuccess
    case invalidUserData
}

//
//  AccountViewModel.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/15/23.
//

import Foundation

final class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthday = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false

    @Published var alertItem: AlertItem?

    var isValidForm: Bool {
        guard !firstName.isEmpty  && !lastName.isEmpty && !email.isEmpty else {
            alertItem = .init(formError: .invalidForm)
            return false
        }

        guard email.isValidEmail else {
            alertItem = .init(formError: .invalidEmail)
            return false
        }

        return true
    }

    func saveChanges() {
        guard isValidForm else { return }

        print("Changes have been saved successfully.")
    }
}

enum FormError {
    case invalidForm
    case invalidEmail
}

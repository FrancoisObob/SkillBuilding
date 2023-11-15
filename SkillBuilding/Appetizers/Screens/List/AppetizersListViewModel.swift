//
//  AppetizersListViewModel.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/13/23.
//

import Foundation

@MainActor final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

    func getAppetizers() async {
        isLoading = true

        do {
            appetizers = try await NetworkManager.shared.getAppetizers()

        } catch {
            if let error = error as? APError { alertItem = .init(apError: error) }
        }

        isLoading = false
    }
}

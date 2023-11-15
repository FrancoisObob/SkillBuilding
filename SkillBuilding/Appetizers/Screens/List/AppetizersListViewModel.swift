//
//  AppetizersListViewModel.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 11/13/23.
//

import Foundation

final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

    func getAppetizers() {
        isLoading = true

        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    self.alertItem = .init(apError: error)
                }
                
                self.isLoading = false
            }
        }
    }
}

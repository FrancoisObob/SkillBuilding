//
//  AppetizersListView.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/19/23.
//

import SwiftUI

struct AppetizersListView: View {

    @StateObject var viewModel = AppetizersListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertItem) { Alert($0) }
    }
}

#Preview {
    AppetizersListView()
}

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
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .task {
                await viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)

            if viewModel.isShowingDetail, let selectedAppetizer = viewModel.selectedAppetizer {
                AppetizerDetailView(appetizer: selectedAppetizer,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }

            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { Alert($0) }
    }
}

#Preview {
    AppetizersListView()
}

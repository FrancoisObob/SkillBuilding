//
//  AppetizersTabView.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/19/23.
//

import SwiftUI

struct AppetizersTabView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizersTabView().environmentObject(Order())
}

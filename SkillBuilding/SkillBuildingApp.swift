//
//  SkillBuildingApp.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/14/23.
//

import SwiftUI
import SwiftData

@main 
struct SkillBuildingApp: App {
    var order = Order()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AppetizersTabView()
                .environmentObject(order)
        }
        .modelContainer(sharedModelContainer)
    }
}

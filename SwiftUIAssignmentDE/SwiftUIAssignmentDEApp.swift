//
//  SwiftUIAssignmentDEApp.swift
//  SwiftUIAssignmentDE
//
//  Created by Angelos Staboulis on 9/3/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUIAssignmentDEApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            DataProduct.self,
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
            ContentView(searchField: "")
        }
        .modelContainer(sharedModelContainer)
    }
}

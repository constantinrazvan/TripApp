//
//  TripApp_SwiftUIApp.swift
//  TripApp-SwiftUI
//
//  Created by Constantin Razvan on 02.09.2021.
//

import SwiftUI

@main
struct TripApp_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

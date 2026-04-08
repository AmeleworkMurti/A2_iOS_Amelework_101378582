//
//  A2_iOS_Amelework_101378582App.swift
//  A2_iOS_Amelework_101378582
//
//  Created by Amelework Murti on 2026-04-08.
//

import SwiftUI
import CoreData

@main
struct A2_iOS_Amelework_101378582App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

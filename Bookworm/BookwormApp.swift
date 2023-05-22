//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ikbal Demirdoven on 2023-05-20.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

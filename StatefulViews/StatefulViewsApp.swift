//
//  StatefulViewsApp.swift
//  StatefulViews
//
//  Created by A S on 06/01/2025.
//

import SwiftUI

@main
struct StatefulViewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(interactor: .init(service: .init())))
        }
    }
}

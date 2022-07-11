//
//  TangiblesApp.swift
//  Tangibles
//
//  Created by Cody Falzone on 6/8/22.
//

import SwiftUI

@main
struct TangiblesApp: App {
    @StateObject var dataModel = DataModel()

    var body: some Scene {
        WindowGroup {
            NavigationView { ContentView() }
            .environmentObject(dataModel)
            .navigationViewStyle(.stack)
        }
    }
}

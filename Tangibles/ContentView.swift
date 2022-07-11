//
//  ContentView.swift
//  Tangibles
//
//  Created by Cody Falzone on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataModel = DataModel()
    @State private var inputImage: UIImage?
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            PhotoPicker(image: $inputImage)
                .tabItem{ Label("Add", systemImage: "plus") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

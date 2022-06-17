//
//  Home.swift
//  Tangibles
//
//  Created by Cody Falzone on 6/8/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        HStack {
            Text("Following")
                .padding()
            Text("Discover")
                .padding()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

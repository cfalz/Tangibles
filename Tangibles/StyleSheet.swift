//
//  StyleSheet.swift
//  Tangibles
//
//  Created by Cody Falzone on 7/3/22.
//

import SwiftUI

extension Image {
    func profileImageStyle() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .clipped()
            .overlay() {
                ZStack{
                    Image(systemName: "camera.fill")
                        .foregroundColor(.gray)
                        .offset(y: 60)
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(.white, lineWidth: 4)
                }
            
        }
        
    }
}

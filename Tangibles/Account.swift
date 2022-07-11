//
//  Account.swift
//  Tangibles
//
//  Created by Cody Falzone on 6/8/22.
//


import SwiftUI

struct AccountView: View {
    
    @State private var profileImage: Image = Image("Profile")
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            ZStack{
                Color.red
                
                profileImage
                    .profileImageStyle()
                    .onTapGesture { showImagePicker = true }
                    .onChange(of: inputImage) { _ in loadImage() }
                    .sheet(isPresented: $showImagePicker) {
                        PhotoPicker(image: $inputImage)
                    }
            }
            Spacer()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {return}
        profileImage = Image(uiImage: inputImage)
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

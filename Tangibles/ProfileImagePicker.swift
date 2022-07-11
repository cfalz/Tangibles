//
//  ImagePickjer.swift
//  Tangibles
//
//  Created by Cody Falzone on 7/3/22.
//

import SwiftUI
import PhotosUI

// Wrap in a UIViewController Representable
struct ImagePicker: UIViewControllerRepresentable {
    @EnvironmentObject var dataModel: DataModel
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator{
        Coordinator(self)
    }
}

// Create a coordinator to pull the sequence of events together
class Coordinator: NSObject,
                   PHPickerViewControllerDelegate,
                   UINavigationControllerDelegate {
    
    let parent: ImagePicker
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]){
        picker.dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider else {return}
        
        if provider.canLoadObject(ofClass: UIImage.self){
            provider.loadObject(ofClass: UIImage.self) { image, _ in
                self.parent.image = image as? UIImage
            }
        }
        
        guard
            let result = results.first,
            result.itemProvider.hasItemConformingToTypeIdentifier(UTType.image.identifier)
        else { return }
        
        // Load a file representation of the picked item.
        // This creates a temporary file which is then copied to the app’s document directory for persistent storage.
        result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, error in
            if let error = error {
                print("Error loading file representation: \(error.localizedDescription)")
            } else if let url = url {
                if let savedUrl = FileManager.default.copyItemToDocumentDirectory(from: url) {
                    // Add the new item to the data model.
                    let item = Item(url: savedUrl)
                    Task { @MainActor in
                        withAnimation {
                            self.parent.dataModel.addItem(item)
                        }
                    }
                }
            }
        }
    }
    init(_ parent: ImagePicker){
        self.parent = parent
    }
}

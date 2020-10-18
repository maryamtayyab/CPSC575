//
//  ContentView.swift
//  WhatsWhere
//
//  Created by Maryam TayyabII on 2020-10-17.
//

import SwiftUI

struct ContentView: View {
    @State var imageData : Data = .init(capacity:0)
    @State var show = false
    @State var imagepicker = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source),isActive: $imagepicker) {
                    
                    Text(" ")
                }
                
                VStack {
                    if imageData.count != 0 {
                        
                        Image(uiImage: UIImage(data: self.imageData)!).resizable().frame(width:250, height:250).cornerRadius(15)
                    }
                    
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        Text("Pic")
                    }
                    
                    
                    
                }.navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .actionSheet(isPresented: $show) {
                    
                    ActionSheet(title: Text(""), message: Text (""), buttons: [.default(Text("Upload"), action: {
                        
                        self.source = .photoLibrary
                        self.imagepicker.toggle()
                    }), .default(Text("Take a Picture"), action: {
                        
                        self.source = .camera
                        self.imagepicker.toggle()
                    })])
                }
            }
            
         
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Imagepicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Imagepicker.Coordinator {
       
        return Imagepicker.Coordinator(parent1: self)
    }
    
    @Binding var show : Bool
    @Binding var image : Data
    var source : UIImagePickerController.SourceType
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Imagepicker>) -> UIImagePickerController {
        
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.delegate = context.coordinator
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<Imagepicker>) {
        
    }
    
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var parent : Imagepicker
        init(parent1 : Imagepicker) {
            
            parent = parent1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            self.parent.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            let data = image.pngData()
            self.parent.image = data!
            self.parent.show.toggle()
        }
    }
}


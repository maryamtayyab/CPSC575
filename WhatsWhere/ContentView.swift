//
//  ContentView.swift
//  WhatsWhere
//
//  Created by Maryam TayyabII on 2020-10-17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text1 = ""
    @State private var text2 = ""
    @State var imageData : Data = .init(capacity:0)
    @State var show = false
    @State var imagepicker = false
    @State var source : UIImagePickerController.SourceType = .photoLibrary
   
    
    var body: some View {
        
        
        
       
        NavigationView {
            
            // zstack lets you have overlapping content
            ZStack {
               
                Color.backgroundColor
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
            
                
                NavigationLink(destination: Imagepicker(show: $imagepicker, image: $imageData, source: source),isActive: $imagepicker) {
                    
                    Text(" ")
                    
                  
                      
                       
                      
                }
                
           
                
                VStack {
                    
                    
                    if imageData.count != 0 {
                        
                        Image(uiImage: UIImage(data: self.imageData)!).resizable().frame(width:250, height:250).cornerRadius(15)
                           
                    }
                    
                    HStack {
                        
                        Button(action: {}) {
                          Image("backButton")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 100)
                            .cornerRadius(40)
                        }
                        
                       
                        Text("Add Item")
                            .frame(width: 260, height: 20, alignment: .topTrailing)
                            .font(Font.system(size: 25, design: .default))
                            
                         
                    }
                    
                    Button(action: {
                        
                        self.show.toggle()
                            
                        
                    }) {
                        //Text("Pic")
                        
                            
                            Image("camera")
                               
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 140, height: 110)
                                .cornerRadius(40)
                                .shadow(radius: 5)
                                .background(Color.backgroundColor)
                                .foregroundColor(Color.backgroundColor)
                                .padding(.all,35)
                            
                        
                   
                    }
                    
                    
                    
                    
            
                    TextField("Item Name", text: $text1)
                        
                     
                        .padding(.all, 30)
                       
                       // .background(Color(red: 239.0/255.0, green: //243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(Font.system(size: 30, design: .default))
                       
                    TextField("Item Location", text: $text2)
                        
                        
                        .padding(.all, 30)
                       // .background(Color(red: 239.0/255.0, green: //243.0/255.0, blue: 244.0/255.0, opacity: 1.0))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(Font.system(size: 30, design: .default))
                   
                  
                    
                    Button(action: { }, label: {
                      Text("Add Item")
                        .font(Font.system(size: 40, design: .default))
                        .padding()
                        .frame(width:250, height:75)
                        .foregroundColor(.white)
                        .background(Color.addItemColor)
                        .cornerRadius(50)
                    })
                    
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

    
    
}

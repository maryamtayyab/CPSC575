//
//  ContentView.swift
//  What's Where
//
//  Created by Jason Li on 2020-10-23.
//

import SwiftUI

struct Item: Identifiable {
    var id: Int
    let itemName, location, imageName: String
}

struct ContentView: View {
    
    let items: [Item] = [
        .init(id: 0, itemName: "Sunglasses", location: "Cupboard", imageName: "zenitsu"),
        .init(id: 1, itemName: "Tape", location: "Drawer", imageName: "Horimiya"),
        .init(id: 2, itemName: "Batteries", location: "Nightstand", imageName: "oreki")
    ]
    
    var body: some View {
        NavigationView {
            List {
//              Text("Stuff").font(.largeTitle)
                ForEach(items) { item in
                    //item row
                    HStack{
                        //add item imagine into here
                        Image(item.imageName)
                            .resizable()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 4))
                            .frame(width:70, height: 70)
                        
                        VStack (alignment: .leading){
                            Text(item.itemName).font(.title)
                            Text(item.location).font(.subheadline)
                        }.padding(.leading, 8)
                    }
                    .padding(.init(top: 12, leading: 0, bottom: 12, trailing:0))
                }
            }
            .navigationBarTitle(Text("Here it is!"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

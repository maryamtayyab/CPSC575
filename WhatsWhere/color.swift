//
//  color.swift
//  WhatsWhere
//
//  Created by Maryam TayyabII on 2020-10-26.
//

import SwiftUI

extension Color {
    
    public static let backgroundColor: Color = Color (UIColor(red: 0.95, green: 0.92, blue: 0.82, alpha: 0.70))
    
    public static let addItemColor: Color = Color (UIColor(red: 0.49, green: 0.54, blue: 0.59, alpha: 1.00))
    
}



struct color_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
            .foregroundColor(.addItemColor)
    }
}

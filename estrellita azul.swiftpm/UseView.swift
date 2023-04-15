//
//  UseView.swift
//  estrellita azul
//
//  Created by Alumno on 13/04/23.
//

import SwiftUI

struct UseView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("DarkPurple")]), startPoint: .top, endPoint: .trailing)
            VStack() {
                Text("How to use").font(.largeTitle)
                    .bold()
                    .padding(100)
                    .foregroundColor(Color.white)
                Text("ARKids es una emocionante aplicación interactiva de realidad aumentada diseñada especialmente para niños menores de edad. Con esta aplicación, los niños podrán sumergirse en un mundo mágico donde pueden tomar fotos y agregar objetos de realidad aumentada para crear imágenes únicas y divertidas.").font(.system(size:30, weight: .medium, design: .rounded))
                    .foregroundColor(Color.white)
                    
                
                Spacer()
                
                Button(action: {}) {
                    NavigationLink {
                        MenuView()
                    } label: {
                        Text("Let's Go")
                            .font(.system(size:45, weight: .medium, design: .rounded))
                    }
                }.padding(39)
                    .frame(width: 250, height: 80)
                    .foregroundColor(.white)
                    .background(Color("BRose"))
                    .cornerRadius(90)
                    .shadow(radius: 10)
                
                Spacer()
            }
            .lineSpacing(10)
            .frame(maxWidth: 900)
            .padding()
        }.background(Image("wallpaper").resizable().frame(width: 1750, height: 1300))
        
        
        
    }
    
}

struct UseView_Previews: PreviewProvider {
    static var previews: some View {
        UseView()
    }
}

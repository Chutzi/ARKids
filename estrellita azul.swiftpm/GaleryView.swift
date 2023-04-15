//
//  GaleryView.swift
//  estrellita azul
//
//  Created by Alumno on 13/04/23.
//

import SwiftUI

struct GaleryView: View {
    let photos = ["Green", "Inicio", "Green"]
    
    var body: some View {
        
        ZStack{
            
            VStack{
                Text("Galery").bold().frame(width: 1200, height: 100, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(.system(size:33, weight: .medium, design: .rounded))
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"),Color("DarkPurple"), Color("DarkFuchsia")]), startPoint: .top, endPoint: .trailing))
                    .minimumScaleFactor(0.5)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(photos, id: \.self) { photo in
                            VStack(){
                                Image(photo)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                    .cornerRadius(10)
                                    .padding(5)
                                Spacer()
                                Text("Hola")
                            }
                            
                        }
                    }
                }
                
            }.frame(width: 800)
        }
    }
}

struct GaleryView_Previews: PreviewProvider {
    static var previews: some View {
        GaleryView()
    }
}

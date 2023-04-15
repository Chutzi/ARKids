//
//  HomeView.swift
//  estrellita azul
//
//  Created by Alumno on 13/04/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("DarkPurple")]), startPoint: .top, endPoint: .trailing)
            VStack{
                
                Text("Choose an option").font(.largeTitle)
                    .bold()
                    .padding(120)
                    .foregroundColor(Color.white)
                Spacer()
                VStack(spacing: 45){
                    Button(action: {}) {
                        NavigationLink {
                            PhotoView()
                        } label: {
                            Image("camera").resizable()
                                .frame(width: 60, height: 60)
                            Text("Scan Photo")
                                .font(.system(size:45, weight: .medium, design: .rounded))
                        }
                    }.padding(39)
                        .frame(width: 650, height: 130)
                        .foregroundColor(.white)
                        .background(Color("CyanLight"))
                        .cornerRadius(90)
                    
                    Button(action: {}) {
                        NavigationLink {
                            GaleryView()
                        } label: {
                            Image("galery").resizable()
                                .frame(width: 80, height: 80)
                            Text("Galery")
                                .font(.system(size:45, weight: .medium, design: .rounded))
                        }
                    }.padding(39)
                        .frame(width: 650, height: 130)
                        .foregroundColor(.white)
                        .background(Color("BlueLight"))
                        .cornerRadius(90)
                }
                
                Spacer(minLength: 200)
            }
        }.background(Image("wallpaper").resizable().frame(width: 1750, height: 1300))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

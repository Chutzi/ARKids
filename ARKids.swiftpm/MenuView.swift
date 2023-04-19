//
//  HomeView.swift
//  estrellita azul
//
//  Created by Chuy on 13/04/23.
//

import SwiftUI
import Photos

struct MenuView: View {
    @State private var countTimer = 0
    @State private var timerRunning = true
    let timer = Timer.publish(every: 0, on: .main, in: .common).autoconnect()
    
    
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
                                .frame(width: 60, height: 60, alignment: .center)
                            Text("Camera")
                                .onReceive(timer) {_ in
                                    
                                    timerRunning = false
                                    
                                }
                                .font(.system(size:45, weight: .medium, design: .rounded))
                        }
                    }.padding(39)
                        .frame(width: timerRunning ? 90 : 650, height: 130)
                        .foregroundColor(.white)
                        .background(Color("Red1"))
                        .cornerRadius(90)
                        .animation(.linear(duration: 0.5))
                    
                    Button(action: {}) {
                        NavigationLink {
                            MyImages()
                        } label: {
                            Image("galery").resizable()
                                .frame(width: 80, height: 80)
                            Text("Photo Picker")
                            
                                .font(.system(size:45, weight: .medium, design: .rounded))
                        }
                    }.padding(39)
                        .frame(width: timerRunning ? 90 : 650, height: 130)
                        .foregroundColor(.white)
                        .background(Color("DarkYellow"))
                        .cornerRadius(90)
                        .animation(.linear(duration: 0.5))
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

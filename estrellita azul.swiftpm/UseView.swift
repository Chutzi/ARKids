//
//  UseView.swift
//  estrellita azul
//
//  Created by Alumno on 13/04/23.
//

import SwiftUI
struct UseView: View {
    @State private var countTimer = 0
    @State private var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            
            VStack() {
                Text("How to use").font(.largeTitle)
                    .bold()
                    .padding(100)
                    .foregroundColor(Color.white)
                
                TabView{
                    
                    OnBoardView(image: "Green", title: "Green example", description: "Texto mucho")
                    OnBoardView(image: "Green", title: "Green example", description: "Texto mucho")
                    OnBoardView(image: "Green", title: "Green example", description: "Texto mucho")
                    Button(action: {}) {
                        NavigationLink {
                            MenuView()
                        } label: {
                            Text("Let's Go")
                                .onReceive(timer) {_ in
                                    if countTimer > 0 && timerRunning{
                                        countTimer -= 1
                                    }else{
                                        timerRunning = false
                                    }
                                    
                                }
                                .font(.system(size:45, weight: .medium, design: .rounded))
                        }
                    }.padding(39)
                        .frame(width: timerRunning ? 20 : 250, height: timerRunning ? 20 : 80)
                        .foregroundColor(.white)
                        .background(Color("BRose"))
                        .cornerRadius(90)
                        .shadow(radius: 10)
                        .animation(.spring())
                    
                }.tabViewStyle(.page(indexDisplayMode: .always))
                //Text("ARKids es una emocionante aplicación interactiva de realidad aumentada diseñada especialmente para niños menores de edad. Con esta aplicación, los niños podrán sumergirse en un mundo mágico donde pueden tomar fotos y agregar objetos de realidad aumentada para crear imágenes únicas y divertidas.").font(.system(size:30, weight: .medium, design: .rounded)).foregroundColor(Color.white)
                    
                
                Spacer()
                
                
                
                Spacer()
            }
            .lineSpacing(10)
            .frame(maxWidth: 900)
            .padding()
        }.background(Image("wallpaper").resizable().frame(width: 1750, height: 1300))
        
        
       
    }
    
}

struct OnBoardView: View {
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("DarkPurple")]), startPoint: .top, endPoint: .trailing)
            Color.clear
            VStack(spacing: 20){
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                Text(title)
                    .font(.system(size: 50)).bold()
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 200)
            
        }.cornerRadius(90)
        
    }
        
    
}

struct UseView_Previews: PreviewProvider {
    static var previews: some View {
        UseView()
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView(image: "Green", title: "Green example", description: "Texto mucho")
    }
}

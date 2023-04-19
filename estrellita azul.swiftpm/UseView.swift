//
//  UseView.swift
//  estrellita azul
//
//  Created by Chuy on 13/04/23.
//

import SwiftUI
struct UseView: View {
    @State private var countTimer = 0
    @State private var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            
            VStack() {
                //Text("How to use").font(.largeTitle).bold().padding(80).foregroundColor(Color.white)
                
                TabView{
                    
                    OnBoardView(image: "biplane", title: "ARKids", description: "ARKids is an exciting interactive augmented reality application designed for all kinds of people, especially for children, where they will discover a magical world where they can take augmented reality photos to create unique and fun images.")
                    OnBoardMenuView(image: "camera", image2: "galery", title: "How to use", description: "There are two options on the menu to choose from: \n\nThe camera where you can take photos with augmented reality.", description2: "The gallery where you can see the photos you took")
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
                
                Spacer()
                Spacer()
            }
            .lineSpacing(10)
            .frame(maxWidth: 900)
            .padding()
        }.background(Image("wallpaper").resizable().frame(width: 1750, height: 1300)).navigationBarBackButtonHidden()
        
        
        
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
                    .frame(width: 130, height: 130)
                    .foregroundColor(.white)
                Text(title)
                    .font(.system(size: 40)).bold()
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 25))
                    
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 200)
            
        }.cornerRadius(90)
        
    }
    
    
}

struct OnBoardMenuView: View {
    let image: String
    let image2: String
    let title: String
    let description: String
    let description2: String
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("DarkPurple")]), startPoint: .top, endPoint: .trailing)
            Color.clear
            VStack(spacing: 20){
                Text(title)
                    .font(.system(size: 40)).bold()
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 25))
                    
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                Text(description2)
                    .font(.system(size: 25))
                    
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Image(image2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
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

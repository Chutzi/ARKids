//
//  GaleryView.swift
//  estrellita azul
//
//  Created by Chuy on 13/04/23.
//

import SwiftUI

struct GaleryView: View {
    let photos = ["Green", "Inicio", "wallpaper", "biplane", "nike"]
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        
        ZStack{
            VStack{
                Text("Gallery").bold().frame(width: 1200, height: 100, alignment: .center)
                    .foregroundColor(Color.white)
                    .font(.system(size:33, weight: .medium, design: .rounded))
                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"),Color("DarkPurple"), Color("DarkFuchsia")]), startPoint: .top, endPoint: .trailing))
                    .minimumScaleFactor(0.5)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
                        ForEach(photos, id: \.self) { photo in
                            ZStack{
                                VStack(){
                                    Image(photo)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                        .cornerRadius(10)
                                        .padding(5)
                                        .overlay(Text("Imagen").foregroundColor(Color.white).font(.system(size:24, weight: .medium, design: .rounded)).padding(9).background(Color.black.opacity(0.6).cornerRadius(10)).offset(x: 0, y: 46).multilineTextAlignment(.leading))
                                        .contextMenu(ContextMenu(menuItems: {
                                            Button(action: {
                                                UIImageWriteToSavedPhotosAlbum(UIImage(named: photo)!, nil, nil, nil)
                                            }){
                                                HStack{
                                                    Text("Saved")
                                                    Image(systemName: "arrow.down").resizable().frame(width: 15, height: 15)
                                                }
                                            }
                                        }))

                                        }
                                    Spacer()
                                }
                        }
                    }
                }
                
            }.frame(width: orientation.isLandscape ? 1100 : 800)
        }.onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

struct GaleryView_Previews: PreviewProvider {
    static var previews: some View {
        GaleryView()
    }
}

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
    @Namespace private var previewSmoothly
    @State private var preview = false
    @State private var selectedImagen: String?
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                mainTitle("Gallery")
                if preview {
                    if let selectedImagen = selectedImagen{
                        image(selectedImagen).ignoresSafeArea()
                    }
                }else{
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
                            
                            ForEach(photos, id: \.self) { photo in
                                ZStack{
                                    VStack(){
                                        image(photo)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    
                }
                
                
            }.frame(width: orientation.isLandscape ? 1100 : 800)
        }.onRotate { newOrientation in
            orientation = newOrientation
        }.background(Image("wallpaper").resizable().frame(width: 1750, height: 1300))
    }
    
    func mainTitle(_ name: String) -> some View {
        Text(name).bold().frame(width: 1200, height: 100, alignment: .center)
            .foregroundColor(Color.white)
            .font(.system(size:33, weight: .medium, design: .rounded))
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"),Color("DarkPurple"), Color("DarkFuchsia")]), startPoint: .top, endPoint: .trailing))
            .minimumScaleFactor(0.5)
    }
    
    func image(_ imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .cornerRadius(10)
            .padding(5)
            .overlay(Text("Imagen").foregroundColor(Color.white).font(.system(size:24, weight: .medium, design: .rounded)).padding(9).background(Color.black.opacity(0.6).cornerRadius(10)).offset(x: 0, y: preview ? -480 : 46).multilineTextAlignment(.leading))
        //          .contextMenu(ContextMenu(menuItems: {
        //              Button(action: {
        //                  UIImageWriteToSavedPhotosAlbum(UIImage(named: imageName)!, nil, nil, nil)
        //              }){
        //                  HStack{
        //                      Text("Saved")
        //                      Image(systemName: "arrow.down").resizable().frame(width: 15, height: 15)
        //                  }
        //              }
        //          }))
            .matchedGeometryEffect(id: imageName, in: previewSmoothly)
            .zIndex(selectedImagen == imageName ? 1 : 0)
            .onTapGesture {
                withAnimation(Animation.easeInOut(duration: 0.5)){
                    selectedImagen = imageName
                    preview.toggle()
                }
            }
    }
    
}

struct GaleryView_Previews: PreviewProvider {
    static var previews: some View {
        GaleryView()
    }
}


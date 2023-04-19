//
//  MyImages.swift
//  ARKids
//
//  Created by Jesus Hernandez on 19/04/23.
//

import SwiftUI

struct MyImages: View {
    @State var selectedImage: UIImage?
    @State private var showPhotoPicker = false
    @State private var orientation = UIDeviceOrientation.unknown
    
    @State private var countTimer = 0
    @State private var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            
            VStack {
                mainTitle("Photo Picker")
                
                Spacer()
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("No image selected")
                        .font(.system(size: 33))
                        .frame(width: 350, height: 80)
                        .foregroundColor(.white)
                        .background(Color("purpleK"))
                        .cornerRadius(90)
                        .shadow(radius: 10)
                        
                        
                }
                VStack{
                    Button(action: {self.showPhotoPicker = true}) {
                         
                            Text("Select Image")
                                .onReceive(timer) {_ in
                                    if countTimer > 0 && timerRunning{
                                        countTimer -= 1
                                    }else{
                                        timerRunning = false
                                    }
                                    
                                }
                                .font(.system(size:45, weight: .medium, design: .rounded))
                        }
                    .padding(39)
                        .frame(width: timerRunning ? 20 : 350, height: timerRunning ? 20 : 80)
                        .foregroundColor(.white)
                        .background(Color("BRose"))
                        .cornerRadius(90)
                        .shadow(radius: 10)
                        .animation(.spring())
                }
                
                Spacer()
                
            }.frame(width: orientation.isLandscape ? 1100 : 800)
            .sheet(isPresented: $showPhotoPicker) {
                PhotoPicker(selectedImage: $selectedImage)
            }
            
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
}

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.sourceType = .photoLibrary
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<PhotoPicker>) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImageFromPicker
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct MyImages_Previews: PreviewProvider {
    static var previews: some View {
        MyImages()
    }
}



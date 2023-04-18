//
//  PhotoView.swift
//  estrellita azul
//
//  Created by Chuy on 13/04/23.
//

import SwiftUI
import RealityKit
import ARKit
import UIKit
import ModelIO
import AVFoundation

struct ARVariables{
  static var arView: ARView!
}

struct PhotoView: View {
    @State private var isPlacemnetEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    
    private var models: [Model] = [Model(modelName: "nike"), Model(modelName: "biplane")]

    @State private var capturedImage: UIImage?
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ARViewContainer()
            
            
            Button {
              
              // Placeholder: take a snapshotç
                ARVariables.arView.snapshot(saveToHDR: false) { (image) in
                  
                  // Compress the image
                  let compressedImage = UIImage(data: (image?.pngData())!)
                  // Save in the photo album
                  UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
                }
              
              } label: {
                Image(systemName: "camera")
                  .frame(width:60, height:60)
                  .font(.title)
                  .background(.white.opacity(0.75))
                  .cornerRadius(30)
                  .padding()
              }
                        
        }.edgesIgnoringSafeArea(.all)
            
    }
}



struct PlacementButtonsView: View{
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View{
        ZStack{
            HStack {
                // Cancel Button
                Button(action: {

                    print("DEBUG: Cancel model placement")
                    self.resetPlacementParameters()
                }){
                    Image(systemName: "xmark")
                        .frame(width: 68, height: 60)
                        .font(.title)
                        .background(Color.white
                        .opacity(0.75))
                        .cornerRadius(30)
                        .padding(20)
                }
                Button(action: {

                    print("DEBUG: Confirm model placement")
                    self.resetPlacementParameters()
                    self.modelConfirmedForPlacement = self.selectedModel
                }){
                    Image(systemName: "checkmark")
                        .frame(width: 68, height: 60)
                        .font(.title)
                        .background(Color.white
                        .opacity(0.75))
                        .cornerRadius(30)
                        .padding(20)
                }
            }
        }
    }
    
    func resetPlacementParameters(){
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    //https://betterprogramming.pub/take-an-arview-snapshot-in-realitykit-93b620cf99b3
    
    let sceneView = ARView(frame: .zero)
        
    func makeUIView(context: Context) -> ARView {
        
        
        if ARWorldTrackingConfiguration.isSupported {
                   
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
                    configuration.isLightEstimationEnabled = true
            
            let arObject = ARObject()
                let anchor = AnchorEntity()
            anchor.addChild(arObject)
            sceneView.scene.anchors.append(anchor)
            

                    sceneView.session.run(configuration, options: [ARSession.RunOptions.resetTracking, ARSession.RunOptions.removeExistingAnchors])
            print("World")
                } else {
                    // WARNING HERE
                    let configuration = AROrientationTrackingConfiguration()
                    print("Orientation")
                    
                    sceneView.session.run(configuration)
                }
            
        return sceneView
            
    }
        
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

struct ModelPickerView: View{
    
    var body: some View{
        VStack{
        
            HStack() {
                Button {
                    print("Hiiiiii")
                } label: {
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width: 65, height: 65)
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: 75, height: 75)
                    }
                }
            }.padding(25)
                //.background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"),Color("DarkPurple"), Color("DarkFuchsia")]), startPoint: .top, endPoint: .trailing).opacity(0.5))
            
        }
        
    }
}
  

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}












//
//  PhotoView.swift
//  estrellita azul
//
//  Created by Chuy on 13/04/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ARVariables{
  static var arView: ARView!
}

struct PhotoView: View {
    @State private var source = UIImagePickerController.SourceType.camera
    @State private var take = false
    @State private var countTimer = 0
    @State private var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            ARViewContainer()
            
            
            Button {
                self.source = .photoLibrary
              // Placeholder: take a snapshot
                ARVariables.arView.snapshot(saveToHDR: false) { (image) in
                  
                    let compressedImage = UIImage(data: (image?.pngData())!)
                      // Save in the photo album
                      UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
                    take = true
                    
                }
              
              } label: {
                Image(systemName: "camera")
                  .frame(width:60, height:60)
                  .font(.title)
                  .background(.white.opacity(0.75))
                  .cornerRadius(30)
                  .padding()
              }
            VStack{
                if take{
                    Text("Saved").onReceive(timer) {_ in
                        if countTimer > 1 && timerRunning{
                            countTimer -= 1
                            timerRunning = true
                        }else{
                            timerRunning = false
                            take = false
                        }
                        
                    }
                    .font(.system(size:45, weight: .medium, design: .rounded))
                    .frame(width: timerRunning ? 20 : 250, height: timerRunning ? 20 : 80)
                    .foregroundColor(timerRunning ? Color("BRose") : .white)
                    .background(Color("BRose"))
                    .cornerRadius(90)
                    .shadow(radius: 10)
                    .animation(.spring())
                    .hoverEffect(.automatic)
                    Spacer()
                }
                
            }
            
                        
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    //https://betterprogramming.pub/take-an-arview-snapshot-in-realitykit-93b620cf99b3
        
    func makeUIView(context: Context) -> ARView {
        ARVariables.arView = ARView(frame: .zero)
        
        if ARWorldTrackingConfiguration.isSupported {
                   
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
                    configuration.isLightEstimationEnabled = true
            
            let arObject = ARObject()
                let anchor = AnchorEntity()
            anchor.addChild(arObject)
            ARVariables.arView.scene.anchors.append(anchor)
            

            ARVariables.arView.session.run(configuration, options: [ARSession.RunOptions.resetTracking, ARSession.RunOptions.removeExistingAnchors])
            print("World")
                } else {
                    // WARNING HERE
                    let configuration = AROrientationTrackingConfiguration()
                    print("Orientation")
                    
                    ARVariables.arView.session.run(configuration)
                }
            
        return ARVariables.arView
            
    }
        
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

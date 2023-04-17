//
//  PhotoView.swift
//  estrellita azul
//
//  Created by Chuy on 13/04/23.
//

import SwiftUI
import RealityKit
import ARKit

struct PhotoView: View {
    @State private var isPlacemnetEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    
    private var models: [Model] = [Model(modelName: "nike"), Model(modelName: "biplane")]
    /*
    private var models: [Model] = {
        let filemanager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try? filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        var availableModels: [Model] = []
        for file in files where
            file.hasSuffix("usdz"){
                let modelName = file.replacingOccurrences(of: ".usdz", with: "")
                let model = Model(modelName: modelName)
                
                availableModels.append(model)
        }
        return availableModels
    }()
     */
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            
            if self.isPlacemnetEnabled{
                PlacementButtonsView(isPlacementEnabled: self.$isPlacemnetEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            } else{
                ModelPickerView(isPlacementEnabled: self.$isPlacemnetEnabled, selectedModel: self.$selectedModel, models: self.models)
            }
        }.background(Image("wallpaper").resizable().frame(width: 1750, height: 1300))
            
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
    @Binding var modelConfirmedForPlacement: Model?
        
    func makeUIView(context: Context) -> ARView {
        let sceneView = ARView(frame: .zero)
        
        if ARWorldTrackingConfiguration.isSupported {
                   
                    let configuration = ARWorldTrackingConfiguration()
                    configuration.planeDetection = ARWorldTrackingConfiguration.PlaneDetection.horizontal
                    configuration.isLightEstimationEnabled = true

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
        if let model = self.modelConfirmedForPlacement{
            if let modelEntity  = model.modelEntity{
                print("Debug > Adding model to scene > \(model.modelName)")
                let anchorEntity = AnchorEntity()
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                
                uiView.scene.addAnchor(anchorEntity)
            }else{
                print("Debug > Unable to load modelEntity for > \(model.modelName)")
            }
        
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
        }
    }
}

struct ModelPickerView: View{
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    
    var models: [Model]
    
    var body: some View{
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 30) {
                    ForEach(0 ..< self.models.count){
                        index in Button(action: {
                            print("\(self.models[index].modelName)")
                            self.selectedModel = self.models[index]
                            self.isPlacementEnabled = true
                        }){
                            Image(uiImage: self.models[index].image)
                                .resizable()
                                .frame(height: 80)
                                .aspectRatio(1/1,contentMode: .fit)
                                .background(Color.white)
                                .cornerRadius(12)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        .padding(20)
        
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

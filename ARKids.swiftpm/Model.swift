//
//  Model.swift
//  estrellita azul
//
//  Created by user238402 on 4/15/23.
//

import UIKit
import RealityKit
import Combine

class Model{
    var modelName : String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        let filename = "Models/" + modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCOmpletion in
                if case let .failure(error) = loadCOmpletion {
                    print("Unable to load a model due to error \(error)")
                }
                self.cancellable?.cancel()
            }, receiveValue: { modelEntity in
                if let model = modelEntity as? ModelEntity {
                    self.modelEntity = model
                    self.cancellable?.cancel()
                    print("Congrats! Model is successfully loaded!")
                    print("SUCCESSFULLY LOADED MODEL")
                }
            })
    }
}

class ARObject: Entity, HasModel {
    required init() {
        super.init()
        self.components[ModelComponent] = ModelComponent(
            mesh: .generateBox(size: 0.1),
            materials: [SimpleMaterial(color: .red, isMetallic: false)]
        )
    }
    
    required init(model: Model) {
        fatalError("init(model:) has not been implemented")
    }
}



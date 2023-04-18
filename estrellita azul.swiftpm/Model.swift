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
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCOmpletion in
                print("Unable to load modelEntity for modelName ", self.modelName)
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("SUCCESSFULLY LOADED MODEL")
            })
    }
}

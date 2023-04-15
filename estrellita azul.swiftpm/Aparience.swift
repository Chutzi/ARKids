//
//  Aparience.swift
//  estrellita azul
//
//  Created by user238402 on 4/14/23.
//

import SwiftUI

struct MyText{
    var text: String
    var body: some View{
        Text(text).font(.system(size:45, weight: .medium, design: .rounded))
    }
}

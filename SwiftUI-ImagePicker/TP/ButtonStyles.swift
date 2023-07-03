//
//  ButtonStyle.swift
//  SwiftUI-ImagePicker
//
//  Created by Leung Yu Wing on 3/7/2023.
//

import Foundation
import SwiftUI


struct NoTapEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}


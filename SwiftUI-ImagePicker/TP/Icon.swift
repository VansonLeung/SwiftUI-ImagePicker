//
//  Icon.swift
//  SwiftUI-ImagePicker
//
//  Created by Leung Yu Wing on 3/7/2023.
//

import Foundation
import SwiftUI


struct RoundedIcon : View {
    var bgColor: Color?
    var size : CGFloat?
    var icon : String?
    var iconSize : CGFloat?
    var iconColor : Color?
    
    var body : some View {
        let size = (size ?? 72)
        let iconSize = iconSize ?? 60
        let bgColor = bgColor ?? TP1ViewElementStyles.shared.activeColorTheme.color_accent
        
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: size / 2)
                .fill(bgColor)
                .frame(width: size, height: size, alignment: .center)

            if let icon = icon {
                Icon(icon: icon, iconSize: iconSize, iconColor: iconColor)
            }
        }
            .frame(width: size, height: size, alignment: .center)
            .contentShape(Rectangle())
        
    }
}



struct Icon : View {
    var icon : String?
    var iconSize : CGFloat?
    var iconColor : Color? = nil

    var body : some View {
        let iconSize = iconSize ?? 60
        Image(icon ?? "")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .tint(iconColor)
        
            .frame(width: iconSize, height: iconSize, alignment: .center)
            .clipped()
    }
}


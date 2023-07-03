//
//  LayoutModifiers.swift
//  hkstp oneapp testing DEV QUICK
//
//  Created by Leung Yu Wing on 13/6/2022.
//

import Foundation
import SwiftUI


public struct TP1AppLayoutModifier: ViewModifier {
    
    public enum FillType {
        case horizontal_fill
        case horizontal_fill_leading
        case horizontal_fill_center
        case horizontal_fill_trailing
    }
    
    var viewElementStyles : TP1ViewElementStyles?
    var fillType: FillType?
    
    public func body(content: Content) -> some View {
        content
            .modifier(Default(
                viewElementStyles: viewElementStyles ?? .shared,
                fillType: fillType
            ))
    }
    
    
    
    public struct Default: ViewModifier {
        @ObservedObject var viewElementStyles: TP1ViewElementStyles
        var fillType: FillType?
        
        func getAlignment() -> Alignment {
            switch fillType {
            case .horizontal_fill:
                return .leading
            case .horizontal_fill_leading:
                return .leading
            case .horizontal_fill_center:
                return .center
            case .horizontal_fill_trailing:
                return .trailing
            case .none:
                return .leading
            }
        }

        public func body(content: Content) -> some View {
            if fillType != nil {
                content.frame(minWidth: 0, maxWidth: .infinity, alignment: getAlignment())
            } else {
                content
            }
        }
        
        private var __viewElementStyles: TP1ViewElementStyles {
            return viewElementStyles
        }
        
    }
    
    
    
    
}

